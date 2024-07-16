//
//  BetRepositoryProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

protocol BetRepositoryProtocol {
    
    func getBets(completion: @escaping([BetProtocol]) -> ())
    func getBetsByGameId(_ gameId: String, completion: @escaping([BetProtocol]) -> ())
    func editBet(id: String, isSuccess: Bool, completion: @escaping (Bool) -> ())
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping () -> ())
}
