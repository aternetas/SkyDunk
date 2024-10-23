//
//  String+ext.swift
//  SkyDunk
//
//  Created by aternetas on 23.07.2024.
//

import Foundation

fileprivate var yearMonthDayFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-d"
    return formatter
}

fileprivate var fullDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return formatter
}

extension String {
    func toDate() -> Date? {
        fullDateFormatter.date(from: self)?.localDate()
    }
}
