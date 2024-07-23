//
//  String+ext.swift
//  SkyDunk
//
//  Created by aternetas on 23.07.2024.
//

import Foundation

fileprivate var yearMonthDayFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-DD"
    return formatter
}

extension String {
    
    func toDate() -> Date {
        yearMonthDayFormatter.date(from: self) ?? Date.now
    }
}
