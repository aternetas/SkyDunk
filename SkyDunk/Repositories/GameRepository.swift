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
            completion(tmpGames)
        }
    }
    
    func addNewBetToGame(gameId: String, completion: @escaping (Bool) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            for i in 0..<tmpGames.count where tmpGames[i].id == gameId {
                let game = tmpGames[i]
                tmpGames[i] = game.copy(activeBetsAmount: game.activeBetsAmount + 1)
                completion(true)
                return
            }
            completion(false)
        }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double, isSuccess: Bool, completion: @escaping (Bool) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) { [weak self] in
            for i in 0..<tmpGames.count where tmpGames[i].id == gameId {
                let game = tmpGames[i]
                let betsResult = self?.calcCommonBetsResult(actualBetsResult: game.betsResult, newBetResult: betResult, isNewBetSuccess: isSuccess)
                tmpGames[i] = game.copy(activeBetsAmount: game.activeBetsAmount - 1, betsResult: betsResult)
                completion(true)
                return
            }
            completion(false)
        }
    }
    
    private func calcCommonBetsResult(actualBetsResult: Double?, newBetResult: Double, isNewBetSuccess: Bool) -> Double {
        isNewBetSuccess ? (actualBetsResult ?? 0.0) + newBetResult : (actualBetsResult ?? 0.0) - newBetResult
    }
}
