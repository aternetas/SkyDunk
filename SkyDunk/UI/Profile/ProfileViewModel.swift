//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 23.10.2024.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func updateCurrentBalance(_ balance: Double)
}

final class ProfileViewModel: BaseViewModel {
    
    weak var delegate: ProfileViewModelDelegate?
    
    private lazy var userService = ServiceFactory.shared.userService
    private lazy var statisticsService = ServiceFactory.shared.statisticsService
    
    func getData() {
        getCurrentBalance()
//        getGeneralStatistics()
//        getBestTeamStatistics()
//        getWorstTeamStatistics()
    }
    
    private func getCurrentBalance() {
        delegate?.updateCurrentBalance(userService.getCurrentBalance())
    }
    
//    private func getGeneralStatistics() {
//        statisticsService.getGeneralStats()
//            .map { GeneralStatisticsVM(model: $0) }
//            .bind(to: generalStatisticsRelay)
//            .disposed(by: disposeBag)
//    }
//    
//    private func getBestTeamStatistics() {
//        statisticsService.getBestTeamStats()
//            .map { TeamStatisticsVM(model: $0) }
//            .bind(to: bestTeamStatisticsRelay)
//            .disposed(by: disposeBag)
//    }
//    
//    private func getWorstTeamStatistics() {
//        statisticsService.getWorstTeamStats()
//            .map { TeamStatisticsVM(model: $0) }
//            .bind(to: worstTeamStatisticsRelay)
//            .disposed(by: disposeBag)
//    }
}
