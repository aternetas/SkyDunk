//
//  BetRepository.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetRepository {
    
    func getBets(completion: @escaping([BetDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(tmpBets)
        })
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([BetDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(tmpBets.filter { $0.gameId == gameId })
        })
    }
    
    func editBet(id: String, description: String? = nil, isSuccess: Bool? = nil) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3, execute: {
            tmpBets.enumerated().forEach { index, dto in
                if dto.id == id {
                    tmpBets[index] = BetDTO(id: id,
                                            gameId: dto.gameId,
                                            description: description ?? dto.description,
                                            betCreated: dto.betCreated,
                                            amount: dto.amount,
                                            coefficient: dto.coefficient,
                                            betOn: dto.betOn,
                                            isSuccess: isSuccess ?? dto.isSuccess)
                }
            }
        })
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String) {        
        tmpBets.append(BetDTO(id: UUID().uuidString,
                              gameId: gameId,
                              description: description,
                              betCreated: .now,
                              amount: amount,
                              coefficient: coefficient,
                              betOn: betOn,
                              isSuccess: nil))
        
    }
}
