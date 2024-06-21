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
        repository.getBets { [weak self] dtos in
            guard let self = self else { return }
            bets = dtos.map { Bet(dto: $0) }
            completion(bets)
        }
    }
    
    func getActiveBets(completion: @escaping([Bet]) -> ()) {
        getBets { bets in
            completion(bets.filter { $0.isSuccess == nil })
        }
    }
}
