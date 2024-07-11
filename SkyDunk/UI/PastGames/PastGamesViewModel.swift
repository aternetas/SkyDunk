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
    
    func viewDidLoad() {
        getPastGames()
        gamesWithActiveBets = getGamesWithActiveBets()
    }
    
    func getPastGames() {
        pastGamesVM = gameService.getPastGames().map { PastGameVM(game: $0, delegate: self) }
        delegate?.updatePastGames()
    }
    
    func getGamesWithActiveBets() -> [GameVM] {
        gameService.getPastGamesWithActiveBets().map { GameVM(game: $0) }
    }
}

extension PastGamesViewModel: PastGameCellListenerProtocol {
    
    func selectGame(gameId: String) {
        navigationManager?.openScreen(screen: .game(gameId: gameId))
    }
}
