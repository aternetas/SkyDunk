//
//  BetRealmRepository.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

class BetRealmRepository: BetRepositoryProtocol {
    
    private var manager: RealmManager
    private var gameRepository: GameRepositoryProtocol
    
    init(manager: RealmManager, gameRepository: GameRepositoryProtocol) {
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
        let res = manager.updateBet(id: id, isSuccess: isSuccess)
        if res.0 != nil && res.1 != nil {
            if manager.updateGame(id: res.1!, betResult: res.0!) {
                completion(true)
            } else { completion(false) }
        } else { completion (false) }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ()) {
        manager.add(obj: BetDTORealm(id: UUID().uuidString,
                                     gameId: gameId,
                                     betDescription: description,
                                     created: .now,
                                     amount: amount,
                                     coefficient: coefficient,
                                     betOn: betOn))
        gameRepository.addNewBetToGame(gameId: gameId) { _ in 
            completion()
        }
    }
}
