//
//  GameRepository.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameRepository: GameRepositoryProtocol {
    
    func getGames(completion: @escaping ([GameProtocol]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            completion(games)
        }
    }
    
    func addNewBetToGame(gameId: String, completion: @escaping (Bool) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            for i in 0..<games.count where games[i].id == gameId {
                let game = games[i]
                games[i] = game.copy(activeBetsAmount: game.activeBetsAmount + 1)
                completion(true)
                return
            }
            completion(false)
        }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double, completion: @escaping (Bool) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            for i in 0..<games.count where games[i].id == gameId {
                let game = games[i]
                games[i] = game.copy(activeBetsAmount: game.activeBetsAmount - 1, betsResult: game.betsResult ?? 0.0 + betResult)
                completion(true)
                return
            }
            completion(false)
        }
    }
}
