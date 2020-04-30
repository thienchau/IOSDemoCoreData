//
//  SortStrategy.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol SortStrategy {
    func decriptor() -> NSSortDescriptor
    func predicate() -> (Garment, Garment) throws -> Bool
}

struct SortByName : SortStrategy {
    
    func predicate() -> (Garment, Garment) throws -> Bool {
        return {
            (a, b) in
            return a.name < b.name
        }
    }
    
    func decriptor() -> NSSortDescriptor {
        return NSSortDescriptor(key: "name", ascending: true)
    }

}

struct SortByDate : SortStrategy {
    
    func predicate() -> (Garment, Garment) throws -> Bool {
        return {
            (a, b) in
            return a.date < b.date
        }
    }
    
    func decriptor() -> NSSortDescriptor {
        return NSSortDescriptor(key: "date", ascending: true)
    }

}
