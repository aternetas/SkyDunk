//
//  BetDTORealm.swift
//  SkyDunk
//
//  Created by aternetas on 15.07.2024.
//

import Foundation
import RealmSwift

class BetDTORealm: Object {
    
    @Persisted var id: String
    @Persisted var gameId: String
    @Persisted var betDescription: String
    @Persisted var created: Date
    @Persisted var amount: Double
    @Persisted var coefficient: Double
    @Persisted var betOn: List<String>
    @Persisted var isSuccess: Bool?
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(id: String, gameId: String, betDescription: String, created: Date, amount: Double, coefficient: Double, betOn: List<String>, isSuccess: Bool? = nil) {
        self.init()
        self.id = id
        self.gameId = gameId
        self.betDescription = betDescription
        self.created = created
        self.amount = amount
        self.coefficient = coefficient
        self.betOn = betOn
        self.isSuccess = isSuccess
    }
}
