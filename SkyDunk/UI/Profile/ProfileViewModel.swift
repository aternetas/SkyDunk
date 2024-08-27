//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import RxRelay

class ProfileViewModel: RxBaseViewModel {
    
    let subject = PublishRelay<StatisticsVM>()
    
    private lazy var statisticsService = ServiceFactory.shared.statisticsService

    func getData() {
        getCommonStatistics()
    }
    
    private func getCommonStatistics() {
        statisticsService.getStats()
            .map { StatisticsVM(model: $0) }
            .bind(to: subject)
            .disposed(by: disposeBag)
    }
}
