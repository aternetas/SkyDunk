//
//  GameRealmRepository.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation

class GameRealmRepository: LocalGameRepositoryProtocol {
    
    private let manager: RealmManager
    
    init(manager: RealmManager) {
        self.manager = manager
    }
    
    func getGames() throws -> [GameProtocol] {
        try manager.getAll(type: GameDTORealm.self)
    }
    
    func addNewBetToGame(gameId: String) throws {
        if let game = manager.getById(id: gameId, type: GameDTORealm.self) {
            let modifiedGame = game.modify(activeBetsAmount: game.activeBetsAmount + 1)
            try manager.update(obj: modifiedGame)
        } else { throw Errors.RealmError.cantGetNewBetToGame }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double) throws -> Bool {
        if let game = manager.getById(id: gameId, type: GameDTORealm.self) {
            let modifiedGame = game.modify(activeBetsAmount: game.activeBetsAmount - 1,
                                           betsResult: (game.betsResult ?? 0.0) + betResult)
            try manager.update(obj: modifiedGame)
            return true
        } else { return false }
    }
    
    func updateGames(games: [GameProtocol]) {
        games.forEach { game in
            manager.update(type: GameDTORealm.self, values: [
                "id": game.id,
                "homeTeam": game.homeTeam,
                "guestTeam": game.guestTeam,
                "homeScore": game.homeScore,
                "date": game.date,
                "guestScore": game.guestScore
            ])
        }
    }
}
