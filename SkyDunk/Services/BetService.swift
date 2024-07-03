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
        repository.getBets { dtos in
            completion(dtos.filter { $0.isSuccess == nil }.map { Bet(dto: $0) })
        }
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([Bet]) -> ()) {
        repository.getBetsByGameId(gameId) { dtos in
            completion(dtos.map { Bet(dto: $0) })
        }
    }
    
    func editBet(id: String, description: String? = nil, isSuccess: Bool? = nil, completion: @escaping () -> ()) {
        repository.editBet(id: id, description: description, isSuccess: isSuccess) {
            completion()
        }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ()) {
        repository.addBet(description: description, amount: amount, coefficient: coefficient, betOn: betOn, gameId: gameId) {
            completion()
        }
    }
}
