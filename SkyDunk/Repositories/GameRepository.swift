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
    
    func addNewBetToGame(gameId: String, completion: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            for i in 0..<tmpGames.count where tmpGames[i].id == gameId {
                let game = tmpGames[i]
                tmpGames[i] = game.copy(activeBetsAmount: game.activeBetsAmount + 1)
                completion()
                break
            }
        }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double, isSuccess: Bool, completion: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) { [weak self] in
            for i in 0..<tmpGames.count where tmpGames[i].id == gameId {
                let game = tmpGames[i]
                let betsResult = self?.calcCommonBetsResult(actualBetsResult: game.betsResult, newBetResult: betResult, isNewBetSuccess: isSuccess)
                tmpGames[i] = game.copy(activeBetsAmount: game.activeBetsAmount - 1, betsResult: betsResult)
                completion()
                break
            }
        }
    }
    
    func removeGame(id: String) -> Bool {
        let startCount = tmpGames.count
        tmpGames.removeAll(where: { $0.id == id })
        return startCount != tmpGames.count
    }
    
    private func calcCommonBetsResult(actualBetsResult: Double?, newBetResult: Double, isNewBetSuccess: Bool) -> Double {
        isNewBetSuccess ? (actualBetsResult ?? 0.0) + newBetResult : (actualBetsResult ?? 0.0) - newBetResult
    }
}
