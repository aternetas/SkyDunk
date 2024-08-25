//
//  StatisticsVM.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import Foundation

class StatisticsVM {
    
    let successBetsCount: String
    let allBetsCount: String
    let winningProcent: String
    let commonEarnings: String
    let bestBet: String
    let worstBet: String
    
    init(successBetsCount: String, allBetsCount: String, winningProcent: String, commonEarnings: String, bestBet: String, worstBet: String) {
        self.successBetsCount = successBetsCount
        self.allBetsCount = allBetsCount
        self.winningProcent = winningProcent
        self.commonEarnings = commonEarnings
        self.bestBet = bestBet
        self.worstBet = worstBet
    }
    
    convenience init(model: Statistics) {
        self.init(successBetsCount: "\(model.successBetsCount)",
                  allBetsCount: "\(model.allBetsCount)",
                  winningProcent: "\(model.winningProcent)%",
                  commonEarnings: (model.commonEarnings > 0 ? "+" : "") + "\(model.commonEarnings)",
                  bestBet: "+\(model.bestBet.rounded(.towardZero))",
                  worstBet: "\(model.worstBet)")
    }
}
