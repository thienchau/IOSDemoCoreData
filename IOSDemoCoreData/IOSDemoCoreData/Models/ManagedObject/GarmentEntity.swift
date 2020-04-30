//
//  GarmentEntity.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import CoreData


extension GarmentEntity {

    var garment: Garment {
        get {
            return Garment(self)
        }
        set {
            self.name = newValue.name
            self.date = newValue.date
        }
    }
}
