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
            let dto = tmpBets.first { $0.id == id }
            let index = tmpBets.firstIndex { $0.id == id }
            guard let dto = dto, let index = index else { return }
            
            tmpBets[index] = dto.copy(isSuccess: isSuccess)
            
            let betResult = self.calcBetResult(amount: dto.amount, coefficient: dto.coefficient)
            self.gameRepository.editGame(gameId: dto.gameId, betResult: betResult, isSuccess: isSuccess) {
                completion()
            }
            completion()
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
