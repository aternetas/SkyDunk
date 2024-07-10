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
    
    private let gameRepo = GameRepository()
    
    private init() {
        let betRepo = BetRepository(gameRepository: gameRepo)
        
        gameService = GameService(repository: gameRepo)
        betService = BetService(repository: betRepo)
    }
}
