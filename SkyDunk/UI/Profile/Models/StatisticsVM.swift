//
//  StatisticsVM.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import Foundation

class StatisticsVM {
    
    let allCases: [KeyValueMarker]

    private let successBetsAmount: KeyValueMarker
    private let allBetsCount: KeyValueMarker
    private let winningPercent: KeyValueMarker
    private let commonEarnings: KeyValueMarker
    private let bestBet: KeyValueMarker
    private let worstBet: KeyValueMarker

    init(model: Statistics) {
        successBetsAmount = .init(key: .sucessBetsAmount, value: "\(model.successBetsCount)", marker: .basic)
        allBetsCount = .init(key: .allBets, value: "\(model.allBetsCount)", marker: .basic)
        winningPercent = .init(key: .winningPercent, value: model.winRatio.toPercent(), marker: model.winRatio.toPercentMarker())
        commonEarnings = .init(key: .commonEarnings, value: model.commonEarnings.toString(), marker: model.commonEarnings.toMarker())
        bestBet = .init(key: .bestBet, value: model.bestBet.toString(), marker: model.bestBet.toMarker())
        worstBet = .init(key: .worstBet, value: model.worstBet.toString(), marker: model.worstBet.toMarker())
        
        allCases = [successBetsAmount, allBetsCount, winningPercent, commonEarnings, bestBet, worstBet]
    }
}
