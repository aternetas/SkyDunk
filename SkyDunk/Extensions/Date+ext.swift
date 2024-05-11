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

fileprivate var hourMinuteFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "k:mm"
    return formatter
}()

extension Date {
    func toDayMonthYear() -> String {
        dayMonthYearFormatter.string(from: self)
    }
    
    func toHourMinute() -> String {
        hourMinuteFormatter.string(from: self)
    }
}
