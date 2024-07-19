//
//  BetDTORealm.swift
//  SkyDunk
//
//  Created by aternetas on 15.07.2024.
//

import Foundation
import RealmSwift

class BetDTORealm: Object, BetProtocol {
    var betOn: [String] { _betOn.map { $0 } }
    
    @Persisted var id: String
    @Persisted var gameId: String
    @Persisted var betDescription: String
    @Persisted var created: Date
    @Persisted var amount: Double
    @Persisted var coefficient: Double
    @Persisted var _betOn: List<String>
    @Persisted var isSuccess: Bool?
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(id: String, gameId: String, betDescription: String, created: Date, amount: Double, coefficient: Double, betOn: [String], isSuccess: Bool? = nil) {
        self.init()
        self.id = id
        self.gameId = gameId
        self.betDescription = betDescription
        self.created = created
        self.amount = amount
        self.coefficient = coefficient
        _betOn.append(objectsIn: betOn)
        self.isSuccess = isSuccess
    }
    
    func modify(isSuccess: Bool) -> BetDTORealm {
        BetDTORealm(id: id,
                    gameId: gameId,
                    betDescription: betDescription,
                    created: created,
                    amount: amount,
                    coefficient: coefficient,
                    betOn: betOn,
                    isSuccess: isSuccess)
    }
}
