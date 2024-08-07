//
//  Bet.swift
//  SkyDunk
//
//  Created by aternetas on 15.05.2024.
//

import Foundation

struct Bet {
    
    let id: String
    let gameId: String
    let betDescription: String
    let сreated: Date
    let amount: Double
    let coefficient: Double
    let betOn: [TeamType]
    let isSuccess: Bool?
    
    init(id: String = UUID().uuidString, gameId: String, description: String, created: Date, amount: Double, coefficient: Double, betOn: [TeamType], isSuccess: Bool?) {
        self.id = id
        self.gameId = gameId
        self.betDescription = description
        self.сreated = created
        self.amount = amount
        self.coefficient = coefficient
        self.betOn = betOn
        self.isSuccess = isSuccess
    }
    
    init(dto: BetProtocol) {
        self.init(id: dto.id,
                  gameId: dto.gameId,
                  description: dto.betDescription,
                  created: dto.created,
                  amount: dto.amount,
                  coefficient: dto.coefficient,
                  betOn: dto.betOn.map { TeamType(rawValue: $0) ?? .other },
                  isSuccess: dto.isSuccess)
    }
}
