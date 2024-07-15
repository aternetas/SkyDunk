//
//  GameRealmRepository.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation

class GameRealmRepository: GameRepositoryProtocol {
    
    private let manager: RealmManager
    
    init(manager: RealmManager) {
        self.manager = manager
    }
    
    func getGames(completion: @escaping ([GameProtocol]) -> ()) {
        completion(manager.getAll(type: GameDTORealm.self))
    }
    
    func addNewBetToGame(gameId: String, completion: @escaping (Bool) -> ()) {
        let game = manager.getById(id: gameId, type: GameDTORealm.self)
        if let game = game {
            game.activeBetsAmount = game.activeBetsAmount + 1
            manager.update(obj: game)
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double, completion: @escaping (Bool) -> ()) {
        let game = manager.getById(id: gameId, type: GameDTORealm.self)
        if let game = game {
            game.activeBetsAmount = game.activeBetsAmount - 1
            game.betsResult = (game.betsResult ?? 0.0) + betResult
            completion(true)
        } else {
            completion(false)
        }
    }
}
