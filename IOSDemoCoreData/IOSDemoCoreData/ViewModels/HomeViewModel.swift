//
//  HomeViewModel.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate : AnyObject {
    func reloadUI()
}

class HomeViewModel : NSObject {
    
    weak var delegate: HomeViewModelDelegate?
    
    var garments: [Garment]?
    
    func loadData(sortStrategy: SortStrategy) {
        
        garments = CoreDataManager.shared.getGarment(sortStrategy: sortStrategy)
        
        delegate?.reloadUI()
    }
    
    func sort(sortStrategy: SortStrategy) {
        
        try? garments?.sort(by: sortStrategy.predicate())
        
        delegate?.reloadUI()
    }
    
}
