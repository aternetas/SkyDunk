//
//  RemoteGameRepository.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

class RemoteGameRepository: RemoteGameRepositoryProtocol {
    
    let manager: RemoteManager
    
    init(manager: RemoteManager) {
        self.manager = manager
    }
    
    func getGames(completion: @escaping ([GameProtocol]) -> ()) {
        manager.getGamesByAF { data in
            completion(data.games.map { GameModel(model: $0.self) })
        }
    }
}
