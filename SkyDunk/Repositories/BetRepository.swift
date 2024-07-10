//
//  BetRepository.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetRepository {
    
    private var gameRepository: GameRepository?
    
    init(gameRepository: GameRepository?) {
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
    
    func editBet(id: String, description: String? = nil, isSuccess: Bool? = nil, completion: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.4, execute: {
            for i in 0..<tmpBets.count {
                if tmpBets[i].id == id {
                    let dto = tmpBets[i]
                    tmpBets[i] = BetDTO(id: id,
                                        gameId: dto.gameId,
                                        description: description ?? dto.description,
                                        created: dto.created,
                                        amount: dto.amount,
                                        coefficient: dto.coefficient,
                                        betOn: dto.betOn,
                                        isSuccess: isSuccess ?? dto.isSuccess)
                    break
                }
            }
            completion()
        })
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
        completion()
    }
}
