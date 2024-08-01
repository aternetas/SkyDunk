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
    
    func getAll<T>(type: T.Type) throws -> [T] where T: Object {
        let items = Array(realm.objects(T.self))
        if items.isEmpty {
            throw Errors.RealmError.cantGetObjs
        }
        return items
    }
    
    func getById<T>(id: String, type: T.Type) -> T? where T: Object {
        realm.object(ofType: type, forPrimaryKey: id)
    }
    
    func update(obj: Object) {
        try! realm.write {
            realm.add(obj, update: .modified)
        }
    }
    
    func update<T>(type: T.Type, values: Any) where T: Object {
        try! realm.write {
            realm.create(T.self, value: values, update: .modified)
        }
    }

    func delete(obj: Object) {
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
