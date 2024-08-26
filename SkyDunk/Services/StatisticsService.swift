//
//  StatisticsService.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import RxSwift

class StatisticsService {
    
    func getStats() -> Observable<Statistics> {
        Observable<Statistics>.just(Statistics(successBetsCount: 110, allBetsCount: 165, winRatio: 59, commonEarnings: 1043, bestBet: 102.3, worstBet: -86))
    }
}
