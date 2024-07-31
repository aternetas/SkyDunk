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
        let realmManager = RealmManager()
        let remoteManager = RemoteManager()
//        gameRepo = GameRealmRepository(manager: realmManager)
//        betRepo = BetRealmRepository(manager: realmManager, gameRepository: gameRepo)
        
//        gameRepo = GameRepository()
//        let betRepo = BetRepository(gameRepository: gameRepo)
        
        let remoteGameRepo = RemoteGameRepository(manager: remoteManager)
        let localGameRepo = GameRealmRepository(manager: realmManager)
        let localBetRepo = BetRealmRepository(manager: realmManager, gameRepository: localGameRepo)
        
        gameService = GameService(remoteRepository: remoteGameRepo, localRepository: localGameRepo)
        betService = BetService(repository: localBetRepo)
    }
}
