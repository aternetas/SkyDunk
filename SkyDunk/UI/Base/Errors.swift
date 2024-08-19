//
//  Errors.swift
//  SkyDunk
//
//  Created by aternetas on 02.08.2024.
//

import Foundation

enum Errors: Error {
    
    enum AlamofireError: Error {
        case cantGetData
        case unknownData
        case nonConvertableData
    }
    
    enum RealmError: Error {
        case cantGetObjs
        case cantGetNewBetToGame
        case cantUpdateObject
        case cantAddObject
    }
    
    enum DecodeError: Error {
        case failedToConvertJSON(_ description: String)
    }
}
