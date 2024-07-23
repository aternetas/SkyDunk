//
//  RemoteServerGameRepository.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

class RemoteServerGameRepository: GameRepositoryProtocol {
    
    let manager: RemoteServerManager
    
    init(manager: RemoteServerManager) {
        self.manager = manager
    }
    
    func getGames(completion: @escaping ([GameProtocol]) -> ()) {
        manager.getGames { data in
            completion(data.games.map { GameModel(model: $0.self) })
        }
    }
    
    func addNewBetToGame(gameId: String, completion: @escaping (Bool) -> ()) {}
    
    func changeGameBetsResult(gameId: String, betResult: Double, completion: @escaping (Bool) -> ()) {}
}
