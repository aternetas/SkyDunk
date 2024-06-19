//
//  BetVM.swift
//  SkyDunk
//
//  Created by aternetas on 15.05.2024.
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
    let betOn: [TeamType]
    let delegate: BetCellListenerProtocol?
    
    init(id: String, description: String, date: String, amount: String, coefficient: String, isActive: Bool, isSuccess: Bool?, betOn: [TeamType], delegate: BetCellListenerProtocol?) {
        self.id = id
        self.description = description
        self.date = date
        self.amount = amount
        self.coefficient = coefficient
        self.isActive = isActive
        self.isSuccess = isSuccess
        self.betOn = betOn
        self.delegate = delegate
    }
    
    convenience init(bet: Bet, delegate: BetCellListenerProtocol?) {
        self.init(id: bet.id,
                  description: bet.description,
                  date: bet.date.toHourMinuteDayMonthYear(),
                  amount: String(bet.amount),
                  coefficient: String(bet.coefficient),
                  isActive: bet.isSuccess == nil,
                  isSuccess: bet.isSuccess,
                  betOn: bet.betOn,
                  delegate: delegate)
    }
    
    func copy(description: String? = nil, isActive: Bool? = nil, isSuccess: Bool? = nil) -> BetVM {
        BetVM(id: id, 
              description: description ?? self.description,
              date: date,
              amount: amount,
              coefficient: coefficient,
              isActive: isActive ?? self.isActive,
              isSuccess: isSuccess ?? self.isSuccess,
              betOn: betOn,
              delegate: delegate)
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

