//
//  GameRepository.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameRepository {
    
    func getGames(completion: @escaping ([GameDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(tmpGames)
        })
    }
    
    func removeGame(id: String) -> Bool {
        let startCount = tmpGames.count
        tmpGames.removeAll(where: { $0.id == id })
        return startCount != tmpGames.count
    }
}
