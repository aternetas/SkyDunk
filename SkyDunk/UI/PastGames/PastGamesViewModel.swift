//
//  LastGamesViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

protocol PastGamesModelDelegate {
    func updatePastGames()
}

class PastGamesViewModel: BaseViewModel {
    
    var delegate: PastGamesModelDelegate?
    
    var pastGamesVM: [PastGameVM] = []
    var gamesWithActiveBets: [GameVM] = []
    
    private let betService = ServiceFactory.shared.betService
    private let gameService = ServiceFactory.shared.gameService
    
    func getGames(completion: @escaping () -> ()) {
        gameService.getGames { [weak self] _ in
            guard let self = self else { return }
            self.pastGamesVM = self.getPastGames()
            self.gamesWithActiveBets = getGamesWithActiveBets()
            completion()
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
