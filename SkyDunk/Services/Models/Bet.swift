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
    let description: String
    let date: Date
    let amount: Double
    let coefficient: Double
    let betOn: [TeamType]
    let isSuccess: Bool?
    
    init(id: String, gameId: String, description: String, date: Date, amount: Double, coefficient: Double, betOn: [TeamType], isSuccess: Bool?) {
        self.id = id
        self.gameId = gameId
        self.description = description
        self.date = date
        self.amount = amount
        self.coefficient = coefficient
        self.betOn = betOn
        self.isSuccess = isSuccess
    }
    
    init(dto: BetDTO) {
        self.init(id: dto.id,
                  gameId: dto.gameId,
                  description: dto.description,
                  date: dto.date,
                  amount: dto.amount,
                  coefficient: dto.coefficient,
                  betOn: dto.betOn.map { TeamType(rawValue: $0) ?? .other },
                  isSuccess: dto.isSuccess)
    }
}
