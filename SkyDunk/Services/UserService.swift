//
//  UserService.swift
//  SkyDunk
//
//  Created by aternetas on 23.10.2024.
//

final class UserService {
    
    private lazy var userDefaultsService = ServiceFactory.shared.userDefaultsService
    private lazy var START_BALANCE = 100.0
    
    private var balance: Double {
        userDefaultsService.getValue(type: Double.self, key: .BALANCE) ?? START_BALANCE
    }
    
    func getCurrentBalance() -> Double {
        balance
    }
}
