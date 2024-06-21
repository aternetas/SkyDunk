//
//  HomeViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import Foundation

protocol HomeViewModelDelegat {
    func updateLastGame(vm: LastGameVM)
    func updateNextGames()
    func updateActiveBets()
    func updateActiveBet(index: Int)
}

class HomeViewModel: BaseViewModel {
    
    let gameService = GameService(repository: GameRepository())
    let betService = BetService(repository: BetRepository())
    
    var delegate: HomeViewModelDelegat?
    var nextGamesVM: [GameVM] = []
    var lastGameVM: LastGameVM? = nil
    var activeBetsVM: [BetVM] = []
    private var games: [Game] = []
    private var activeBets: [Bet] = []
    
    func viewDidLoad() {
        getGames()
        getActiveBets()
    }
    
    func selectGame(id: String) {
        let game = games.first(where: { $0.id == id } )
        if let game = game {
            navigationManager?.openScreen(screen: .game(game: game))
        }
    }
    
    private func getGames() {
        gameService.getGames { [weak self] games in
            self?.games = games
            self?.setLastGame()
            self?.setNextGames()
        }
    }
    
    private func getActiveBets() {
        betService.getActiveBets { [weak self] bets in
            self?.activeBets = bets
            self?.setActiveBets()
        }
    }
    
    private func setNextGames() {
        nextGamesVM = gameService.getNextGames().map { GameVM(game: $0) }
        delegate?.updateNextGames()
    }
    
    private func setLastGame() {
        self.lastGameVM = LastGameVM(game: gameService.getLastGame())
        delegate?.updateLastGame(vm: lastGameVM!)
    }

    private func setActiveBets() {
        activeBetsVM = activeBets.map { BetVM(bet: $0, delegate: self) }
        if activeBets.count > 0 {
            delegate?.updateActiveBets()
        }
    }
}

extension HomeViewModel: BetCellListenerProtocol {
    
    func tapOnSuccessBet(id: String) {
        changeBetStatus(id: id, isSuccess: true)
    }
    
    func tapOnFailureBet(id: String) {
        changeBetStatus(id: id, isSuccess: false)
    }
    
    func tapOnBet(id: String) {
        guard let index = activeBetsVM.firstIndex(where: { $0.id == id}) else { return }
        activeBetsVM[index] = activeBetsVM[index].copy(description: activeBetsVM[index].description + " CHANGE")
        delegate?.updateActiveBet(index: index)
    }
    
    private func changeBetStatus(id: String, isSuccess: Bool) {
        guard let index = activeBetsVM.firstIndex(where: { $0.id == id}) else { return }
        activeBetsVM[index] = activeBetsVM[index].copy(isActive: false, isSuccess: isSuccess)
        filterActiveBetsVM()
        delegate?.updateActiveBets()
    }
    
    private func filterActiveBetsVM() {
        activeBetsVM = activeBetsVM.filter { $0.isSuccess == nil }
    }
}
