//
//  RealmManager.swift
//  SkyDunk
//
//  Created by aternetas on 13.07.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    
    var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Realm Instance Is Missing")
        }
    }
    
    func add<T>(obj: T) throws where T: Object {
        try realm.write {
            realm.add(obj)
        }
    }
    
    func getAll<T>(type: T.Type) throws -> [T] where T: Object {
        Array(realm.objects(T.self))
    }

    func getById<T>(id: String, type: T.Type) throws -> T? where T: Object {
        realm.object(ofType: type, forPrimaryKey: id)
    }
    
    func update(obj: Object) throws {
        try realm.write {
            realm.add(obj, update: .modified)
        }
    }
    
    func update<T>(type: T.Type, values: Any) throws where T: Object {
        try realm.write {
            realm.create(T.self, value: values, update: .modified)
        }
    }

    func delete(obj: Object) throws {
        try realm.write {
            realm.delete(obj)
        }
    }
    
    func delete<T>(id: String, type: T.Type) throws where T: Object {
        guard let obj = realm.object(ofType: type, forPrimaryKey: id) else { return }
        try realm.write {
            realm.delete(obj)
        }
    }
}
