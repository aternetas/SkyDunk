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
    private let betRepo: BetRepositoryProtocol
    
    private init() {
//        let realmManager = RealmManager()
//        gameRepo = GameRealmRepository(manager: realmManager)
//        betRepo = BetRealmRepository(manager: realmManager, gameRepository: gameRepo)
        
//        gameRepo = GameRepository()
//        let betRepo = BetRepository(gameRepository: gameRepo)
        
        gameRepo = RemoteServerGameRepository(manager: RemoteServerManager())
        betRepo = BetRealmRepository(manager: RealmManager(), gameRepository: GameRepository())
        
        gameService = GameService(repository: gameRepo)
        betService = BetService(repository: betRepo)
    }
}
