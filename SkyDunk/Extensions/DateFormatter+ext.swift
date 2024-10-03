//
//  DateFormatter+ext.swift
//  SkyDunk
//
//  Created by aternetas on 10.08.2024.
//

import Foundation

extension DateFormatter {
    
    convenience init(dateFormat: String, timeZone: TimeZone? = .gmt) {
        self.init()
        self.dateFormat = dateFormat
        self.timeZone = timeZone
    }
}
