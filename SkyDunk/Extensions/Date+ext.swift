//
//  Date+ext.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

fileprivate let dayMonthYearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = .gmt
    formatter.dateFormat = "d.MM.Y"
    return formatter
}()

fileprivate let hourMinuteFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = .gmt
    formatter.dateFormat = "k:mm"
    return formatter
}()

fileprivate var hourMinuteDayMonthYearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = .gmt
    formatter.dateFormat = "k:mm d.MM.yy"
    return formatter
}()

fileprivate let yearMonthDayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = .gmt
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

extension Date {
    
    func toDayMonthYear() -> String {
        dayMonthYearFormatter.string(from: self)
    }
    
    func toHourMinute() -> String {
        hourMinuteFormatter.string(from: self)
    }
    
    func toHourMinuteDayMonthYear() -> String {
        hourMinuteDayMonthYearFormatter.string(from: self)
    }
    
    func toYearMonthDay() -> String {
        yearMonthDayFormatter.string(from: self)
    }
}
