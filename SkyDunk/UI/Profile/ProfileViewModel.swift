//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import RxSwift
import RxRelay

class ProfileViewModel: BaseViewModel {
    
    let subject = PublishRelay<StatisticsVM>()
    let disposeBag = DisposeBag()
    
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
