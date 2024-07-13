//
//  RealmManager.swift
//  SkyDunk
//
//  Created by aternetas on 13.07.2024.
//

import Foundation
import RealmSwift

class GameDTO2: Object {
    
    @Persisted var id: ObjectId
    @Persisted var homeTeam: String
    @Persisted var guestTeam: String
    @Persisted var date: Date
    @Persisted var homeScore: Int
    @Persisted var guestScore: Int
    @Persisted var activeBetsAmount: Int
    @Persisted var betsResult: Double?
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(id: ObjectId, homeTeam: String, guestTeam: String, date: Date, homeScore: Int, guestScore: Int, activeBetsAmount: Int, betsResult: Double? = nil) {
        self.init()
        self.id = id
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.date = date
        self.homeScore = homeScore
        self.guestScore = guestScore
        self.activeBetsAmount = activeBetsAmount
        self.betsResult = betsResult
    }
}

class BetDTO1: Object {
    
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

class RealmManager {
    
    let realm = try! Realm()
    
    func add<T>(obj: T) where T: Object {
        try! realm.write {
            realm.add(obj)
        }
    }
    
    func getAll<T>(type: T.Type) -> [T] where T: Object {
        Array(realm.objects(T.self))
    }
    
    func getById<T>(id: ObjectId, type: T.Type) -> T? where T: Object {
        realm.object(ofType: type, forPrimaryKey: id)
    }
    
    func update<T>(obj: T) where T: Object {
        realm.add(obj, update: .modified)
    }
    
    func delete<T>(obj: Object, type: T.Type) where T: Object {
        realm.delete(obj)
    }
    
    func delete<T>(id: ObjectId, type: T.Type) -> Bool where T: Object {
        let obj = realm.object(ofType: type, forPrimaryKey: id)
        if let obj = obj {
            realm.delete(obj)
            return true
        } else {
            return false
        }
    }
}
