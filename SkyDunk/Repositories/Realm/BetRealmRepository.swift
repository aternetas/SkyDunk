//
//  BetRealmRepository.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

class BetRealmRepository: BetRepositoryProtocol {
    
    var manager: RealmManager
    
    init(manager: RealmManager) {
        self.manager = manager
    }
    
    func getBets(completion: @escaping ([BetProtocol]) -> ()) {
        completion(manager.getAll(type: BetDTORealm.self))
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping ([BetProtocol]) -> ()) {
        getBets { bets in
            completion(bets.filter { $0.id == gameId })
        }
    }
    
    func editBet(id: String, isSuccess: Bool, completion: @escaping (Bool) -> ()) {
        if let bet = manager.getById(id: id, type: BetDTORealm.self) {
            bet.isSuccess = isSuccess
            manager.update(obj: bet)
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ()) {
        manager.add(obj: BetDTORealm(id: UUID().uuidString,
                                     gameId: gameId,
                                     betDescription: description,
                                     created: .now,
                                     amount: amount,
                                     coefficient: coefficient,
                                     betOn: betOn))
    }
}