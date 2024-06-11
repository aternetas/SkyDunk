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
    
    private func setNextGames() {
        nextGamesVM = games.map { GameVM(game: $0) }
        delegate?.updateNextGames()
    }
    
    private func setLastGame() {
        self.lastGameVM = LastGameVM(game: gameService.getLastGame())
        delegate?.updateLastGame(vm: lastGameVM!)
    }
    
    private func getActiveBets() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            guard let self = self else { return }
            self.activeBets = [
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil)
            ]
            self.setActiveBets()
        })
    }
    
    private func setActiveBets() {
        activeBetsVM = activeBets.filter { $0.isSuccess == nil }
            .map { BetVM(bet: $0, delegate: self) }
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
