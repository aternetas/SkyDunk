//
//  LastGamesViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

protocol PastGamesModelDelegate {
    func updatePastGames()
    func showEmptyState(isShow: Bool)
}

class PastGamesViewModel: BaseViewModel {
    
    var delegate: PastGamesModelDelegate?
    
    var pastGamesVM: [PastGameVM] = []
    var gamesWithActiveBetsVM: [GameVM] = []
    
    private let betService = ServiceFactory.shared.betService
    private let gameService = ServiceFactory.shared.gameService

    func viewDidLoad() {
        gameService.getGames() { [weak self] res in
            switch res {
            case .success(_):
                self?.getPastGames()
                self?.updatePastGames()
            case .failure(_):
                self?.delegate?.showEmptyState(isShow: true)
            }
        }
    }
    
    func updatePastGames() {
        delegate?.updatePastGames()
    }
    
    private func getPastGames() {
        let pastGames = gameService.getPastGames()
        pastGamesVM = pastGames.filter { $0.activeBetsAmount == 0 }.map { [weak self] in
            PastGameVM(game: $0, delegate: self)
        }
        gamesWithActiveBetsVM = pastGames.filter { $0.activeBetsAmount != 0 }.map { GameVM(game: $0) }
    }
}

extension PastGamesViewModel: PastGameCellListenerProtocol {
    
    func selectGame(gameId: String) {
        navigationManager?.openScreen(screen: .game(gameId: gameId))
    }
}
