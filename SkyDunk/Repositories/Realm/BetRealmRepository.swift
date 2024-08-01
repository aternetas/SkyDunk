//
//  BetRealmRepository.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

class BetRealmRepository: BetRepositoryProtocol {
    
    private var manager: RealmManager
    private var gameRepository: LocalGameRepositoryProtocol
    
    init(manager: RealmManager, gameRepository: LocalGameRepositoryProtocol) {
        self.manager = manager
        self.gameRepository = gameRepository
    }
    
    func getBets(completion: @escaping ([BetProtocol]) -> ()) {
        completion(manager.getAll(type: BetDTORealm.self))
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping ([BetProtocol]) -> ()) {
        getBets { bets in
            completion(bets.filter { $0.gameId == gameId })
        }
    }
    
    func editBet(id: String, isSuccess: Bool, completion: @escaping (Bool) -> ()) {
        if let bet = manager.getById(id: id, type: BetDTORealm.self) {
            let modifiedBet = bet.modify(isSuccess: isSuccess)
            manager.update(obj: modifiedBet)
            
            let betResult = bet.amount * bet.coefficient
            if gameRepository.changeGameBetsResult(gameId: bet.gameId, betResult: isSuccess ? betResult : -betResult) {
                    completion(true)
                } else {
                    manager.update(obj: bet)
                    completion(false)
                }
        } else { completion(false) }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ()) {
        manager.add(obj: BetDTORealm(id: UUID().uuidString,
                                     gameId: gameId,
                                     betDescription: description,
                                     created: .now,
                                     amount: amount,
                                     coefficient: coefficient,
                                     betOn: betOn))
        if gameRepository.addNewBetToGame(gameId: gameId) {
            completion()
        }
    }
}
