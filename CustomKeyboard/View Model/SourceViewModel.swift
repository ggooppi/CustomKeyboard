//
//  SourceViewModel.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import Foundation

//MARK:- NameCell Struct
struct NameCellData {
    let index: Int
    let name: String
    let isPersisted: Bool
}

//MARK:- Viewmodel Protocol
protocol SourceViewModel: class {
    func getNames() -> [String]
    func getCellDataFor(index: Int) -> NameCellData
    func toggleDataPersistent(for cellData: NameCellData, state: Bool)
}

//MARK:- Viewmodel Implementation
class SourceViewModelImpl: SourceViewModel {
    
    //MARK: Properties
    private let dataRepository: DataSource
    
    init(dataSource: DataSource = DataSourceImpl()) {
        dataRepository = dataSource
    }
    
    //MARK: Protocol Methods
    func getNames() -> [String] { dataRepository.getData() }
    
    func getCellDataFor(index: Int) -> NameCellData{
        
        let keyboardData = KeyboardData()
        keyboardData.id = index.toString()
        keyboardData.selectedName = getNames()[index]
        
        return NameCellData(index: index,
                     name: getNames()[index],
                     isPersisted: dataRepository.isStored(name: keyboardData))
        
    }
    
    func toggleDataPersistent(for cellData: NameCellData, state: Bool){
        
        let keyboardData = KeyboardData()
        keyboardData.id = cellData.index.toString()
        keyboardData.selectedName = cellData.name
        
        if state{
            dataRepository.saveToDatabase(name: keyboardData)
        }else{
            dataRepository.deleteFromDatabase(name: keyboardData)
        }
    }
}
