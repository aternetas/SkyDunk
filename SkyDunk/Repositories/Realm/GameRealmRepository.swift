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
        if manager.updateGame(id: gameId) {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double, completion: @escaping (Bool) -> ()) {
        if manager.updateGame(id: gameId, betResult: betResult) {
            completion(true)
        } else {
            completion(false)
        }
    }
}
