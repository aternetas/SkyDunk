//
//  BetRepository.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetRepository: BetRepositoryProtocol {
    
    private var gameRepository: GameRepositoryProtocol
    
    init(gameRepository: GameRepositoryProtocol) {
        self.gameRepository = gameRepository
    }
    
    func getBets(completion: @escaping([BetProtocol]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1, execute: {
            completion(bets)
        })
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([BetProtocol]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(bets.filter { $0.gameId == gameId })
        })
    }
    
    func editBet(id: String, isSuccess: Bool, completion: @escaping (Bool) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.4) { [weak self] in
            guard let self = self else { return }
            for i in 0..<bets.count where bets[i].id == id {
                let dto = bets[i]
                bets[i] = dto.copy(isSuccess: isSuccess)
                
                let betResult = dto.amount * dto.coefficient
                gameRepository.changeGameBetsResult(gameId: dto.gameId, betResult: isSuccess ? betResult : -(betResult)) { _ in
                    completion(true)
                }
                completion(true)
                return
            }
            completion(false)
        }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ()) {
        bets.append(BetDTO(id: UUID().uuidString,
                              gameId: gameId,
                              description: description,
                              created: .now,
                              amount: amount,
                              coefficient: coefficient,
                              betOn: betOn,
                              isSuccess: nil))
        gameRepository.addNewBetToGame(gameId: gameId) { _ in
            completion()
        }
    }
}
