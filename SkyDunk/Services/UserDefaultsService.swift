//
//  UserDefaultsService.swift
//  SkyDunk
//
//  Created by aternetas on 11.08.2024.
//

import Foundation

enum Key: String {
    case LAST_UPDATION_DATE = "lastUpd"
    case BALANCE = "balance"
}

class UserDefaultsService {
    
    private lazy var startSeasonDate = Date(timeIntervalSince1970: TimeInterval(1729436400))
    
    var lastUpdationDate: Date {
        getValue(type: Date.self, key: .LAST_UPDATION_DATE) ?? startSeasonDate
    }
    
    private let defaults = UserDefaults.standard
    
    func setNewValue(value: Any?, key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func getValue<T>(type: T.Type, key: Key) -> T? {
        defaults.object(forKey: key.rawValue) as? T
    }
}
