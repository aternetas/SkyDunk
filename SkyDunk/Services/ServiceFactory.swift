//
//  ServiceFactory.swift
//  SkyDunk
//
//  Created by aternetas on 26.06.2024.
//

import Foundation

class ServiceFactory {
    
    static let shared = ServiceFactory()
    
    let gameService: GameService
    let betService: BetService
    
    private init() {
        let gameRepo = GameRepository()
        let betRepo = BetRepository()
        
        gameService = GameService(repository: gameRepo)
        betService = BetService(repository: betRepo)
    }
}
