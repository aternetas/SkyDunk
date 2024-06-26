//
//  Date+ext.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

fileprivate var dayMonthYearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d.MM.Y"
    return formatter
}()

fileprivate var hourMinuteFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

fileprivate var hourMinuteDayMonthYearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm d.MM.yy" 
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
    
    func add(years: Int? = nil, months: Int? = nil, days: Int? = nil, hours: Int? = nil, minutes: Int? = nil) -> Date {
        var newDate = self
        
        if let years = years {
            newDate = Calendar.current.date(byAdding: .year, value: years, to: newDate)!
        }
        
        if let months = months {
            newDate = Calendar.current.date(byAdding: .month, value: months, to: newDate)!
        }
        
        if let days = days {
            newDate = Calendar.current.date(byAdding: .day, value: days, to: newDate)!
        }
        
        if let hours = hours {
            newDate = Calendar.current.date(byAdding: .hour, value: hours, to: newDate)!
        }

        if let minutes = minutes {
            newDate = Calendar.current.date(byAdding: .minute, value: minutes, to: newDate)!
        }
        
        return newDate
    }
    
    /**
     This method returns date by text representation
     
     The method returns an optional value since the text or format may be incorrect

     - parameter text: Date text value
     - parameter format: Date format
     - returns: Date?
     
     # Example #
    ```
     if let date1 = Date.getByText("2024 04 12 14:30") {
      print(date)
     }
     
     if let date2 = Date.getByText("22:30", format: "HH:mm") {
      print(date)
     }
     ```
    */
    static func getByText(_ text: String, format: String = "yyyy MM dd HH:mm") -> Date? {
        let fmt = DateFormatter()
        fmt.dateFormat = format
        return fmt.date(from: text)
    }
}
