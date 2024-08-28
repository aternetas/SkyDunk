//
//  GeneralStatistics.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import Foundation

struct GeneralStatistics: GeneralStatisticsProtocol {
    
    let successBetsCount: Int
    let allBetsCount: Int
    let winRatio: Double
    let commonEarnings: Double
    
    let bestBet: Double
    let worstBet: Double
}
