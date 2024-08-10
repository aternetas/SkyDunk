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
    func showEmptyState(isShow: Bool)
}

class HomeViewModel: BaseViewModel {
    
    private let betService = ServiceFactory.shared.betService
    private let gameService = ServiceFactory.shared.gameService
    
    var delegate: HomeViewModelDelegat?
    var nextGamesVM: [GameVM] = []
    var lastGameVM: LastGameVM? = nil
    var activeBetsVM: [BetVM] = []
    private var games: [Game] = []
    private var activeBets: [Bet] = []
    
    private lazy var lastUpdationDate: Date = .now
    
    func viewDidLoad() {
        getGames()
        getActiveBets()
    }
    
    func selectGame(id: String) {
        navigationManager?.openScreen(screen: .game(gameId: id))
    }
    
    func getActiveBets() {
        betService.getActiveBets { [weak self] res in
            switch res {
            case .success(let bets):
                self?.activeBets = bets
                self?.setActiveBets()
            case .failure(_):
                self?.showAlert(model: .getObjectNotExistError(type: .bets))
            }
        }
    }
    
    private func getGames() {
        gameService.getGames(lastUpdation: lastUpdationDate.toYearMonthDay()) { [weak self] result in
            switch result {
            case .success(let games):
                self?.lastUpdationDate = .now
                self?.games = games
                self?.setLastGame()
                self?.setNextGames()
            case .failure(_):
                self?.delegate?.showEmptyState(isShow: true)
            }
        }
    }
    
    private func setNextGames() {
        nextGamesVM = gameService.getNextGames().map { GameVM(game: $0) }
        delegate?.updateNextGames()
    }
    
    private func setLastGame() {
        guard let game = gameService.getLastGame() else { return }
        self.lastGameVM = LastGameVM(game: game)
        delegate?.updateLastGame(vm: lastGameVM!)
    }

    private func setActiveBets() {
        activeBetsVM = activeBets.map { BetVM(bet: $0, delegate: self) }
        delegate?.updateActiveBets()
    }
}

extension HomeViewModel: BetCellListenerProtocol {
    
    func selectSuccessPrediction(id: String) {
        changeBetStatus(id: id, isSuccess: true)
    }
    
    func selectFailurePrediction(id: String) {
        changeBetStatus(id: id, isSuccess: false)
    }
    
    func selectBet(id: String) {}
    
    private func changeBetStatus(id: String, isSuccess: Bool) {
        betService.editBet(id: id, isSuccess: isSuccess) { [weak self] res in
            switch res {
            case .success(_):
                self?.getActiveBets()
            case .failure(_):
                self?.showAlert(model: .getCantUpdateObject(type: .bet))
            }
        }
    }
}
