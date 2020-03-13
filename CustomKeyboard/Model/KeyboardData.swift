//
//  Data.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import Foundation
import RealmSwift

class KeyboardData: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var selectedName: String = ""
}
