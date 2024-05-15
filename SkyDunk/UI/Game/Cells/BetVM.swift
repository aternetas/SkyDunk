//
//  BetVM.swift
//  SkyDunk
//
//  Created by f f on 15.05.2024.
//

import Foundation

class BetVM {
    
    let id: String
    let description: String
    let date: String
    let amount: String
    let coefficient: String
    let isActive: Bool
    let isSuccess: Bool?
    let teams: [TeamType]
    
    init(id: String, description: String, date: String, amount: String, coefficient: String, isActive: Bool, isSuccess: Bool?, teams: [TeamType]) {
        self.id = id
        self.description = description
        self.date = date
        self.amount = amount
        self.coefficient = coefficient
        self.isActive = isActive
        self.isSuccess = isSuccess
        self.teams = teams
    }
    
    convenience init(bet: Bet) {
        self.init(id: bet.id,
                  description: bet.description,
                  date: bet.date.toDayMonthYear(),
                  amount: String(bet.amount),
                  coefficient: String(bet.coefficient),
                  isActive: bet.isSuccess == nil,
                  isSuccess: bet.isSuccess,
                  teams: bet.teams)
    }
}

