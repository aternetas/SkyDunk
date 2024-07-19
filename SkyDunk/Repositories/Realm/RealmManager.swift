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
    
    func update(obj: Object) {
        try! realm.write {
            realm.add(obj, update: .modified)
        }
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
