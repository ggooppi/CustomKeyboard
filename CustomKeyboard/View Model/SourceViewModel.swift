//
//  SourceViewModel.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import Foundation

//MARK:- Viewmodel Protocol
protocol SourceViewModel: class {
    func getNames() -> [String]
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
}
