//
//  Garment.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct Garment {
    
    var name: String
    var date: Date

    init(_ entity: GarmentEntity) {
        self.name = entity.name ?? ""
        self.date = entity.date ?? Date()
    }
    
    init(_ name: String) {
        self.name = name
        self.date = Date()
    }
}
