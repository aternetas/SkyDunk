//
//  GeneralStatisticsVM.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import UIKit

struct GeneralStatisticsVM: GeneralStatisticsVMProtocol {
    
    let allCases: [KeyValueMarker]

    internal let successBetsAmount: KeyValueMarker
    internal let allBetsCount: KeyValueMarker
    internal let winningPercent: KeyValueMarker
    internal let commonEarnings: KeyValueMarker
    
    private let bestBet: KeyValueMarker
    private let worstBet: KeyValueMarker
    
    init(model: GeneralStatistics) {
        successBetsAmount = .init(key: .sucessBetsAmount, value: "\(model.successBetsCount)", marker: .basic)
        allBetsCount = .init(key: .allBets, value: "\(model.allBetsCount)", marker: .basic)
        winningPercent = .init(key: .winningPercent, value: model.winRatio.toPercent(), marker: model.winRatio.toPercentMarker())
        commonEarnings = .init(key: .commonEarnings, value: model.commonEarnings.toString(), marker: model.commonEarnings.toMarker())
        bestBet = .init(key: .bestBet, value: model.bestBet.toString(), marker: model.bestBet.toMarker())
        worstBet = .init(key: .worstBet, value: model.worstBet.toString(), marker: model.worstBet.toMarker())
        
        allCases = [successBetsAmount, allBetsCount, winningPercent, commonEarnings, bestBet, worstBet]
    }
}
