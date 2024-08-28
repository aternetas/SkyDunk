//
//  StatisticsService.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import RxSwift

class StatisticsService {
    
    func getGeneralStats() -> Observable<GeneralStatistics> {
        Observable<GeneralStatistics>.just(GeneralStatistics(successBetsCount: 110, allBetsCount: 165, winRatio: 59, commonEarnings: 1043, bestBet: 102.3, worstBet: -86))
    }
    
    func getBestTeamStats() -> Observable<TeamStatistics> {
        Observable<TeamStatistics>
            .just(TeamStatistics(team: .bostonCeltics, type: .best, successBetsCount: 10, allBetsCount: 12, winRatio: 83, commonEarnings: 120))
    }
    
    func getWorstTeamStats() -> Observable<TeamStatistics> {
        Observable<TeamStatistics>
            .just(TeamStatistics(team: .miamiHeats, type: .worst, successBetsCount: 2, allBetsCount: 12, winRatio: 20, commonEarnings: 10))
    }
}
