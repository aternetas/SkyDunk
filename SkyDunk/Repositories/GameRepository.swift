//
//  GameRepository.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameRepository {
    
    func getGames(completion: @escaping ([GameDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            completion(tmpGames)
        }
    }
    
    func editGame(gameId: String, completion: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            tmpGames.enumerated().forEach { index, game in
                if game.id == gameId {
                    tmpGames[index] = game.copy()
                    completion()
                }
            }
        }
    }
    
    func editGame(gameId: String, betResult: Double, isSuccess: Bool, completion: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            tmpGames.enumerated().forEach { index, game in
                if game.id == gameId {
                    tmpGames[index] = game.copy(betResult: betResult, isSuccess: isSuccess)
                    completion()
                }
            }
        }
    }
    
    func removeGame(id: String) -> Bool {
        let startCount = tmpGames.count
        tmpGames.removeAll(where: { $0.id == id })
        return startCount != tmpGames.count
    }
}
