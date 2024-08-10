//
//  Date+ext.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

fileprivate let dayMonthYearFormatter: DateFormatter = {
    DateFormatter(dateFormat: "d.MM.Y")
}()

fileprivate let hourMinuteFormatter: DateFormatter = {
    DateFormatter(dateFormat: "k:mm")
}()

fileprivate var hourMinuteDayMonthYearFormatter: DateFormatter = {
    DateFormatter(dateFormat: "k:mm d.MM.yy")
}()

fileprivate let yearMonthDayFormatter: DateFormatter = {
    DateFormatter(dateFormat: "yyyy-MM-dd")
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
