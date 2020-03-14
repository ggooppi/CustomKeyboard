//
//  DataSource.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import Foundation

//MARK:- DataSource Protocol
protocol DataSource: class {
    func getData() -> [String]
    func getStoredData() -> [String]
    func saveToDatabase(name: KeyboardData)
    func deleteFromDatabase(name: KeyboardData)
    func isStored(name: KeyboardData) -> Bool
}

//MARK:- DataSource Implementation
class DataSourceImpl: DataSource {
    
    //MARK: Properties
    private let staticNames = ["Dhiraj", "Tripti", "Gopi", "Ifran", "Suraj", "Sangeetha", "Brindha", "Madhan", "Ajith", "Vijay", "Simbu", "Dhanush"]
    
    private let client: DataSourceClient
    
    init(client: DataSourceClient = DataSourceClientImpl.shared) {
        self.client = client
    }
    
    //MARK: Protocol Methods
    func getData() -> [String] { staticNames }
    
    func getStoredData() -> [String] {
        var convertedString = [String]()
        let keyboardData = client.get(type: KeyboardData.self)
        keyboardData.forEach { (object) in
            if let data = object as? KeyboardData{
                convertedString.append(data.selectedName)
            }
        }
        return convertedString
    }
    
    func saveToDatabase(name: KeyboardData) { client.save(object: name, type: KeyboardData.self, id: name.id) }
    
    func deleteFromDatabase(name: KeyboardData){ client.delete(type: KeyboardData.self, id: name.id) }
    
    func isStored(name: KeyboardData) -> Bool { client.isStored(type: KeyboardData.self, id: name.id)  }
    
}
