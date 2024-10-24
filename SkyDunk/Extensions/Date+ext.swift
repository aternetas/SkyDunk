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
    
    func toOneWeekAgo() -> Date {
        Date(timeInterval: -605000, since: self)
    }
}


extension Date {
    func localDate() -> Date {
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: self) else { return self }
        return localDate
    }
}
