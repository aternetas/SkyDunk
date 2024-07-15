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
    
    private let gameRepo: GameRepositoryProtocol
    
    private init() {
        let realmManager = RealmManager()
        gameRepo = GameRealmRepository(manager: realmManager)
//        gameRepo = GameRepository()
        
        let betRepo = BetRepository(gameRepository: gameRepo)
        
        gameService = GameService(repository: gameRepo)
        betService = BetService(repository: betRepo)
    }
}
