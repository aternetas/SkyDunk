//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import RxCocoa

class ProfileViewModel: RxBaseViewModel {
    
    private lazy var userService = ServiceFactory.shared.userService
    private lazy var statisticsService = ServiceFactory.shared.statisticsService
    
    let currentBalanceRelay = PublishRelay<Double>()
    let generalStatisticsRelay = PublishRelay<GeneralStatisticsVM>()
    let bestTeamStatisticsRelay = PublishRelay<TeamStatisticsVM>()
    let worstTeamStatisticsRelay = PublishRelay<TeamStatisticsVM>()

    func getData() {
        getCurrentBalance()
        getGeneralStatistics()
        getBestTeamStatistics()
        getWorstTeamStatistics()
    }
    
    private func getCurrentBalance() {
        userService.getCurrentBalance()
            .bind(to: currentBalanceRelay)
            .disposed(by: disposeBag)
    }
    
    private func getGeneralStatistics() {
        statisticsService.getGeneralStats()
            .map { GeneralStatisticsVM(model: $0) }
            .bind(to: generalStatisticsRelay)
            .disposed(by: disposeBag)
    }
    
    private func getBestTeamStatistics() {
        statisticsService.getBestTeamStats()
            .map { TeamStatisticsVM(model: $0) }
            .bind(to: bestTeamStatisticsRelay)
            .disposed(by: disposeBag)
    }
    
    private func getWorstTeamStatistics() {
        statisticsService.getWorstTeamStats()
            .map { TeamStatisticsVM(model: $0) }
            .bind(to: worstTeamStatisticsRelay)
            .disposed(by: disposeBag)
    }
}
