//
//  LocalBetRepositoryProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

protocol LocalBetRepositoryProtocol {
    
    func getBets() -> [BetProtocol]
    func getBetsByGameId(_ gameId: String) -> [BetProtocol]
    func editBet(id: String, isSuccess: Bool) -> Bool
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String) 
}
