//
//  Errors.swift
//  SkyDunk
//
//  Created by aternetas on 02.08.2024.
//

import Foundation

enum Errors: Error {
    
    enum AlamofireError: Error {
        case cantGetData(_ description: String)
    }
    
    enum RealmError: Error {
        case cantGetObjs(_ type: Any)
        case cantGetNewBetToGame
        case cantUpdateObject
    }
    
    enum DecodeError: Error {
        case failedToConvertJSON(_ description: String)
    }
}
