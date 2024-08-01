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
    
    func getGames() -> [GameProtocol] {
        manager.getAll(type: GameDTORealm.self)
    }
    
    func addNewBetToGame(gameId: String) -> Bool {
        if let game = manager.getById(id: gameId, type: GameDTORealm.self) {
            let modifiedGame = game.modify(activeBetsAmount: game.activeBetsAmount + 1)
            manager.update(obj: modifiedGame)
            return true
        } else { return false }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double, completion: @escaping (Bool) -> ()) {
        if let game = manager.getById(id: gameId, type: GameDTORealm.self) {
            let modifiedGame = game.modify(activeBetsAmount: game.activeBetsAmount - 1,
                                           betsResult: (game.betsResult ?? 0.0) + betResult)
            manager.update(obj: modifiedGame)
            completion(true)
        } else { completion(false) }
    }
    
    func updateGames(games: [GameProtocol], completion: @escaping () -> ()) {
        games.forEach { game in
            manager.update(type: GameDTORealm.self, values: [
                "id": game.id,
                "homeScore": game.homeScore,
                "guestScore": game.guestScore
            ])
        }
        completion()
    }
}
