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
}
