//
//  BetVM.swift
//  SkyDunk
//
//  Created by f f on 15.05.2024.
//

import Foundation

protocol BetCellListenerProtocol {
    func tapOnSuccessBet(id: String)
    func tapOnFailureBet(id: String)
    func tapOnBet(id: String)
}

class BetVM {
    
    let id: String
    let description: String
    let date: String
    let amount: String
    let coefficient: String
    let isActive: Bool
    let isSuccess: Bool?
    let teams: [TeamType]
    let delegate: BetCellListenerProtocol?
    
    init(id: String, description: String, date: String, amount: String, coefficient: String, isActive: Bool, isSuccess: Bool?, teams: [TeamType], delegate: BetCellListenerProtocol?) {
        self.id = id
        self.description = description
        self.date = date
        self.amount = amount
        self.coefficient = coefficient
        self.isActive = isActive
        self.isSuccess = isSuccess
        self.teams = teams
        self.delegate = delegate
    }
    
    convenience init(bet: Bet, delegate: BetCellListenerProtocol?) {
        self.init(id: bet.id,
                  description: bet.description,
                  date: bet.date.toDayMonthYear(),
                  amount: String(bet.amount),
                  coefficient: String(bet.coefficient),
                  isActive: bet.isSuccess == nil,
                  isSuccess: bet.isSuccess,
                  teams: bet.teams,
                  delegate: delegate)
    }
    
    func copy(description: String? = nil, isActive: Bool? = nil, isSuccess: Bool? = nil) -> BetVM {
        BetVM(id: id, description: description ?? self.description, date: date, amount: amount, coefficient: coefficient, isActive: isActive ?? self.isActive, isSuccess: isSuccess ?? self.isSuccess, teams: teams, delegate: delegate)
    }
    
    func tapOnSuccessBet() {
        delegate?.tapOnSuccessBet(id: id)
    }
    
    func tapOnFailureBet() {
        delegate?.tapOnFailureBet(id: id)
    }
    
    func tapOnBet() {
        delegate?.tapOnBet(id: id)
    }
}

