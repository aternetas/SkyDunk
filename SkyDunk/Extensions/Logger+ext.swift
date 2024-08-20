//
//  Logger+ext.swift
//  SkyDunk
//
//  Created by aternetas on 08.08.2024.
//

import OSLog

protocol MyLogger {
    
    var fileName: String { get }
    
    func logInfo(_ message: String, funcName: String)
    func logError(_ message: String, funcName: String)
    func logFault(_ message: String, funcName: String)
}

fileprivate extension Logger {
    
    private static let logger = Logger(subsystem: "skydunk", category: "my logs")
    
    static func createLog(_ message: String, _ logType: OSLogType, fileName: String, funcName: String) {
    #if DEBUG
        logger.log(level: logType, "\(String(describing: [message, fileName, funcName].joined(separator: " | ")))")
    #endif
    }
}

//default realization
extension MyLogger {
    
    var fileName: String {
        String(describing: self)
    }
    
    func logInfo(_ message: String, funcName: String) {
        Logger.createLog(message, .info, fileName: fileName, funcName: funcName)
    }
    
    func logError(_ message: String, funcName: String) {
        Logger.createLog(message, .error, fileName: fileName, funcName: funcName)
    }
    
    func logFault(_ message: String, funcName: String) {
        Logger.createLog(message, .fault, fileName: fileName, funcName: funcName)
    }
}
