//
//  Logger+ext.swift
//  SkyDunk
//
//  Created by aternetas on 08.08.2024.
//

import OSLog

protocol MyLogger {
    
    func log(_ message: String, _ logType: OSLogType, funcName: String)
}

extension Logger {
    
    private static let logger = Logger(subsystem: "skydunk", category: "my logs")
    
    static func createLog(_ message: String, _ logType: OSLogType, fileName: String, funcName: String) {
    #if DEBUG
        logger.log(level: logType, "\(String(describing: [message, fileName, funcName].joined(separator: " | ")))")
    #endif
    }
}
