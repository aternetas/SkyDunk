//
//  LocalBetRepositoryProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

class BetRealmRepository: LocalBetRepositoryProtocol {
    
    private var manager: RealmManager
    private var gameRepository: LocalGameRepositoryProtocol
    
    init(manager: RealmManager, gameRepository: LocalGameRepositoryProtocol) {
        self.manager = manager
        self.gameRepository = gameRepository
    }
    
    func getBets() throws -> [BetProtocol] {
        try manager.getAll(type: BetDTORealm.self)
    }
    
    func getBetsByGameId(_ gameId: String) throws -> [BetProtocol] {
        try getBets().filter { $0.gameId == gameId }
    }
    
    func editBet(id: String, isSuccess: Bool) throws {
        if let bet = try manager.getById(id: id, type: BetDTORealm.self) {
            let modifiedBet = bet.modify(isSuccess: isSuccess)
            try manager.update(obj: modifiedBet)
            
            let betResult = (bet.amount * bet.coefficient).rounded(.toNearestOrAwayFromZero)
            try gameRepository.changeGameBetsResult(gameId: bet.gameId, betResult: isSuccess ? betResult : -betResult)
        }}
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String) throws {
        try manager.add(obj: BetDTORealm(id: UUID().uuidString,
                                     gameId: gameId,
                                     betDescription: description,
                                     created: .now,
                                     amount: amount,
                                     coefficient: coefficient,
                                     betOn: betOn))
        try gameRepository.addNewBetToGame(gameId: gameId)
    }
}
