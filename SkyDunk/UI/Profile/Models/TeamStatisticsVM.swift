//
//  TeamStatisticsVM.swift
//  SkyDunk
//
//  Created by aternetas on 28.08.2024.
//

import Foundation

struct TeamStatisticsVM: GeneralStatisticsVMProtocol {
    
    let allCases: [KeyValueMarker]
    
    private(set) var team: TeamType
    private(set) var type: TeamBetsStatus

    internal let successBetsAmount: KeyValueMarker
    internal let allBetsCount: KeyValueMarker
    internal let winningPercent: KeyValueMarker
    internal let commonEarnings: KeyValueMarker
    
    init(model: TeamStatistics) {
        team = model.team
        type = model.type
        successBetsAmount = .init(key: .sucessBetsAmount, value: "\(model.successBetsCount)", marker: .basic)
        allBetsCount = .init(key: .allBets, value: "\(model.allBetsCount)", marker: .basic)
        winningPercent = .init(key: .winningPercent, value: model.winRatio.toPercent(), marker: model.winRatio.toPercentMarker())
        commonEarnings = .init(key: .commonEarnings, value: model.commonEarnings.toString(), marker: model.commonEarnings.toMarker())
        
        allCases =  [successBetsAmount, allBetsCount, winningPercent, commonEarnings]
    }
}
