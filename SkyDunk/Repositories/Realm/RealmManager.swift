//
//  RealmManager.swift
//  SkyDunk
//
//  Created by aternetas on 13.07.2024.
//

import Foundation
import RealmSwift
import OSLog

class RealmManager {
    
    private static var fileName = #file.split(separator: "/").last as Any
    
    lazy var realm: Realm = {
        do {
            let realm = try Realm()
            return realm
        } catch {
            logFault("Realm Instance Is Missing", funcName: #function)
            fatalError("Realm Instance Is Missing")
        }
    }()
    
    func add<T>(obj: T) throws where T: Object {
        try realm.write {
            realm.add(obj)
            logInfo("💾  obj \(obj) was added in Realm", funcName: #function)
        }
    }
    
    func getAll<T>(type: T.Type) throws -> [T] where T: Object {
        let objs = Array(realm.objects(T.self))
        logInfo("💾  got objs \(objs) from Realm", funcName: #function)
        return objs
    }

    func getById<T>(id: String, type: T.Type) throws -> T? where T: Object {
        let obj = realm.object(ofType: type, forPrimaryKey: id)
        logInfo("💾  got obj \(String(describing: obj)) from Realm", funcName: #function)
        return obj
    }
    
    func update(obj: Object) throws {
        try realm.write {
            realm.add(obj, update: .modified)
            logInfo("💾  obj \(obj) was updated in Realm", funcName: #function)
        }
    }
    
    func update<T>(type: T.Type, values: Any) throws where T: Object {
        try realm.write {
            realm.create(T.self, value: values, update: .modified)
            logInfo("💾  obj of type \(type) and its new values \(values) was modified in Realm", funcName: #function)
        }
    }

    func delete(obj: Object) throws {
        try realm.write {
            realm.delete(obj)
            logInfo("💾 obj \(obj) was deleted from Realm", funcName: #function)
        }
    }
    
    func delete<T>(id: String, type: T.Type) throws where T: Object {
        guard let obj = realm.object(ofType: type, forPrimaryKey: id) else { return }
        try realm.write {
            realm.delete(obj)
            logInfo("💾 obj \(obj) was deleted from Realm", funcName: #function)
        }
    }
}

extension RealmManager: MyLogger {}
