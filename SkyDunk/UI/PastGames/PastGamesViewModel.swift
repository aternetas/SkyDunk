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
    var gamesWithActiveBets: [GameVM] = []
    
    private let betService = ServiceFactory.shared.betService
    private let gameService = ServiceFactory.shared.gameService

    func viewDidLoad() {
        gameService.getGames { [weak self] games in
            guard let self = self else { return }
            if games.count == 0 {
                self.delegate?.showEmptyState(isShow: true)
            } else {
                self.pastGamesVM = self.getPastGames()
                self.gamesWithActiveBets = self.getGamesWithActiveBets()
                updatePastGames()
            }
        }
    }
    
    func updatePastGames() {
        delegate?.updatePastGames()
    }
    
    private func getPastGames() -> [PastGameVM] {
        gameService.getPastGames().map { PastGameVM(game: $0, delegate: self) }
    }
    
    private func getGamesWithActiveBets() -> [GameVM] {
        gameService.getPastGamesWithActiveBets().map { GameVM(game: $0) }
    }
}

extension PastGamesViewModel: PastGameCellListenerProtocol {
    
    func selectGame(gameId: String) {
        navigationManager?.openScreen(screen: .game(gameId: gameId))
    }
}
