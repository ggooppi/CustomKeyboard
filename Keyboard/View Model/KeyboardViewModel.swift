//
//  KeyboardViewModel.swift
//  Keyboard
//
//  Created by gopinath.a on 14/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import Foundation

//MARK:- Viewmodel Protocol
protocol KeyboardViewModel: class {
    func getNames() -> [String]
}

//MARK:- Viewmodel Implementation
class KeyboardViewModelImpl: KeyboardViewModel {
    
    
    //MARK: Properties
    private let dataRepository: DataSource
    
    init(dataSource: DataSource = DataSourceImpl()) {
        dataRepository = dataSource
    }
    
    func getNames() -> [String] {
        dataRepository.getStoredData()
    }
    
}
