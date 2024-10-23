//
//  ProfileViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 23.10.2024.
//

import Foundation

final class ProfileViewModel: BaseViewModel {
    
    private lazy var userService = ServiceFactory.shared.userService
    private lazy var statisticsService = ServiceFactory.shared.statisticsService
}
