//
//  BetVM.swift
//  SkyDunk
//
//  Created by aternetas on 15.05.2024.
//

import Foundation

protocol BetCellListenerProtocol: AnyObject {
    func selectSuccessPrediction(id: String)
    func selectFailurePrediction(id: String)
    func selectBet(id: String)
}

class BetVM {
    
    let id: String
    let betDescription: String
    let date: String
    let amount: String
    let coefficient: String
    let isActive: Bool
    let isSuccess: Bool?
    let betOn: [TeamType]
    weak var delegate: BetCellListenerProtocol?
    
    init(id: String, description: String, date: String, amount: String, coefficient: String, isActive: Bool, isSuccess: Bool?, betOn: [TeamType], delegate: BetCellListenerProtocol?) {
        self.id = id
        self.betDescription = description
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
                  description: bet.betDescription,
                  date: bet.сreated.toHourMinuteDayMonthYear(),
                  amount: String(bet.amount),
                  coefficient: String(bet.coefficient),
                  isActive: bet.isSuccess == nil,
                  isSuccess: bet.isSuccess,
                  betOn: bet.betOn,
                  delegate: delegate)
    }
    
    func copy(description: String? = nil, isActive: Bool? = nil, isSuccess: Bool? = nil) -> BetVM {
        BetVM(id: id, 
              description: description ?? self.betDescription,
              date: date,
              amount: amount,
              coefficient: coefficient,
              isActive: isActive ?? self.isActive,
              isSuccess: isSuccess ?? self.isSuccess,
              betOn: betOn,
              delegate: delegate)
    }
    
    func selectSuccessPrediction() {
        delegate?.selectSuccessPrediction(id: id)
    }
    
    func selectFailurePrediction() {
        delegate?.selectFailurePrediction(id: id)
    }
    
    func selectBet() {
        delegate?.selectBet(id: id)
    }
}

