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
    
    func getGames(completion: @escaping (Result<[GameProtocol], Error>) -> ()) {
        manager.fetch(type: GamePayload.self, path: "v1/games", params: ["seasons[]": 2023, "postseason": true]) { result in
            switch result {
            case .success(let data):
                if data.games.isEmpty {
                    completion(.failure(Errors.AlamofireError.cantGetData("")))
                } else {
                    completion(.success(data.games.map { GameModel(model: $0) }))
                }
            case .failure(_):
                completion(.failure(Errors.AlamofireError.cantGetData("")))
            }
        }
    }
}
