//
//  BetRepository.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetRepository {
    
    private var gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func getBets(completion: @escaping([BetDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1, execute: {
            completion(tmpBets)
        })
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([BetDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(tmpBets.filter { $0.gameId == gameId })
        })
    }
    
    func editBet(id: String, isSuccess: Bool, completion: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.4) { [weak self] in
            guard let self = self else { return }
            for i in 0..<tmpBets.count where tmpBets[i].id == id {
                let dto = tmpBets[i]
                tmpBets[i] = dto.copy(isSuccess: isSuccess)
                
                let betResult = calcBetResult(amount: dto.amount, coefficient: dto.coefficient)
                gameRepository.editGame(gameId: dto.gameId, betResult: betResult, isSuccess: isSuccess) {
                    completion()
                }
                completion()
            }
        }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ()) {
        tmpBets.append(BetDTO(id: UUID().uuidString,
                              gameId: gameId,
                              description: description,
                              created: .now,
                              amount: amount,
                              coefficient: coefficient,
                              betOn: betOn,
                              isSuccess: nil))
        gameRepository.editGame(gameId: gameId) {
            completion()
        }
    }
    
    private func calcBetResult(amount: Double, coefficient: Double) -> Double {
        amount * coefficient
    }
}
