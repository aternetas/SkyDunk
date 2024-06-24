//
//  BetService.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetService {
    
    private let repository: BetRepository
    
    init(repository: BetRepository) {
        self.repository = repository
    }
    
    func getBets(completion: @escaping([Bet]) -> ()) {
        repository.getBets { dtos in
            completion(dtos.map { Bet(dto: $0) })
        }
    }
    
    func getActiveBets(completion: @escaping([Bet]) -> ()) {
        getBets { bets in
            completion(bets.filter { $0.isSuccess == nil })
        }
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([Bet]) -> ()) {
        repository.getBetsByGameId(gameId) { dtos in
            completion(dtos.map { Bet(dto: $0) })
        }
    }
    
    func editBet(id: String, description: String? = nil, isSuccess: Bool? = nil) {
        repository.editBet(id: id, description: description, isSuccess: isSuccess)
    }
}
