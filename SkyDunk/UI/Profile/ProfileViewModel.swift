//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import RxCocoa

class ProfileViewModel: RxBaseViewModel {
    
    private lazy var statisticsService = ServiceFactory.shared.statisticsService
    
    let generalStatisticsRelay = PublishRelay<GeneralStatisticsVM>()
    let bestTeamStatisticsRelay = PublishRelay<TeamStatisticsVM>()
    let worstTeamStatisticsRelay = PublishRelay<TeamStatisticsVM>()

    func getData() {
        getGeneralStatistics()
        getBestTeamStatistics()
        getWorstTeamStatistics()
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
