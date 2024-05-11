//
//  Date+ext.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import Foundation

fileprivate var dayMonthYearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d.MM.Y"
    return formatter
}()

extension Date {
    func toDayMonthYear() -> String {
        dayMonthYearFormatter.string(from: self)
    }
}
