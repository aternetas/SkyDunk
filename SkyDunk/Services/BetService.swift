//
//  BetService.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetService {
    
    private let repository: BetRepository
    private var bets: [Bet] = []
    
    init(repository: BetRepository) {
        self.repository = repository
    }
    
    func getBets(completion: @escaping([Bet]) -> ()) {
        repository.getBets { dtos in
            completion(dtos.map { Bet(dto: $0) })
        }
    }
}
