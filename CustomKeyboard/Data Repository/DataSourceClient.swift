//
//  DataSourceClient.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataSourceClient: class {
    func get(type: Object.Type) -> Results<Object>
    func save(object: Object, type: Object.Type, id: String)
    func delete(type: Object.Type, id: String)
    func isStored(type: Object.Type, id: String) -> Bool
}

class DataSourceClientImpl: DataSourceClient {
    
    //MARK: Properties
    static var shared = DataSourceClientImpl()
    private let realm: Realm
    
    private init() {
        let fileURL = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.com.innoplexus.CustomKeyboard")!
            .appendingPathComponent("default.realm")
        let config = Realm.Configuration(fileURL: fileURL)
        realm = try! Realm(configuration: config)
    }
    
    func get(type: Object.Type) -> Results<Object> { realm.objects(type) }
    
    func save(object: Object, type: Object.Type, id: String) {
        
        let storedObject = realm.objects(type).filter("id == '\(id)'")
        
        if storedObject.count == 0{
            do {
                try realm.write {
                    realm.add(object)
                }
            } catch {
                print("Failed to save, \(error)")
            }
        }
    }
    
    func delete(type: Object.Type, id: String) {
        do {
            try realm.write {
                realm.delete(getObject(id: id, type: type))
            }
        } catch {
            print("Failed to save, \(error)")
        }
    }
    
    func isStored(type: Object.Type, id: String) -> Bool {
        getObject(id: id, type: type).count > 0 ? true : false
    }
    
    private func getObject(id: String, type: Object.Type) -> Results<Object> {
        let result = realm.objects(type).filter("id = '\(id)'")
        return result
    }
}
