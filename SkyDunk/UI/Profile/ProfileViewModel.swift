//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import Foundation

protocol ProfileViewModelDelegate {
    func updateCases(cases: StatisticsVM)
}

class ProfileViewModel: BaseViewModel {
    
    var delegate: ProfileViewModelDelegate?
    
    private lazy var statisticsService = ServiceFactory.shared.statisticsService
    
    func getCases() {
        delegate?.updateCases(cases: StatisticsVM(model: statisticsService.getStatistics()))
    }
}
