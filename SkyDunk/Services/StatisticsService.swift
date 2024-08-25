//
//  StatisticsService.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import Foundation

class StatisticsService {
    
    func getStatistics() -> Statistics {
        Statistics(successBetsCount: 100, allBetsCount: 167, winRatio: 59, commonEarnings: 1043, bestBet: 102.3, worstBet: -86)
    }
}
