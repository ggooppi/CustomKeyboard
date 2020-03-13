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
    func save(object: Object, type: Object.Type, id: String)
    func delete(type: Object.Type, id: String)
    func isStored(type: Object.Type, id: String) -> Bool
}

class DataSourceClientImpl: DataSourceClient {
    
    let realm = try! Realm()
    
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
