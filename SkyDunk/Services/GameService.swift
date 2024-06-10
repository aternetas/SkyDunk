//
//  GameService.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameService {
    private let repository: GameRepository
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func getGames(completion: @escaping ([Game]) -> ()) {
        repository.getGames { dtos in
            let models = dtos.map { Game(dto: $0) }
            completion(models)
        }
    }
}
