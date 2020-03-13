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
    func save(object: Object)
}

class DataSourceClientImpl: DataSourceClient {
    let realm = try! Realm()
    
    func save(object: Object) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Failed to save, \(error)")
        }
    }
}
