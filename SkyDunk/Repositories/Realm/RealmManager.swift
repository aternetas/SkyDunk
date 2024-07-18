//
//  RealmManager.swift
//  SkyDunk
//
//  Created by aternetas on 13.07.2024.
//

import Foundation
import RealmSwift

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
    
    func getById<T>(id: String, type: T.Type) -> T? where T: Object {
        realm.object(ofType: type, forPrimaryKey: id)
    }
    
    func updateGame(id: String) -> Bool {
        if let game = getById(id: id, type: GameDTORealm.self) {
            try! realm.write {
                game.activeBetsAmount += 1
                return true
            }
        }
        return false
    }
    
    func updateGame(id: String, betResult: Double) -> Bool {
        if let game = getById(id: id, type: GameDTORealm.self) {
            try! realm.write {
                game.activeBetsAmount -= 1
                game.betsResult = (game.betsResult ?? 0.0) + betResult
                return true
            }
        }
        return false
    }
    
    func updateBet(id: String, isSuccess: Bool) -> (Double?, String?) {
        if let bet = getById(id: id, type: BetDTORealm.self) {
            try! realm.write {
                bet.isSuccess = isSuccess
            }
            let res = bet.amount * bet.coefficient
            return (isSuccess ? res : -res, bet.gameId)
        } else { return (nil, nil) }
    }
    
    func delete<T>(obj: Object, type: T.Type) where T: Object {
        realm.delete(obj)
    }
    
    func delete<T>(id: String, type: T.Type) -> Bool where T: Object {
        let obj = realm.object(ofType: type, forPrimaryKey: id)
        if let obj = obj {
            realm.delete(obj)
            return true
        } else {
            return false
        }
    }
}
