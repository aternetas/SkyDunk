//
//  TeamStatistics.swift
//  SkyDunk
//
//  Created by aternetas on 28.08.2024.
//

import Foundation

struct TeamStatistics: GeneralStatisticsProtocol {
    
    let team: TeamType
    let type: TeamBetsStatus
    
    let successBetsCount: Int
    let allBetsCount: Int
    let winRatio: Double
    let commonEarnings: Double
}
