//
//  AddViewModel.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol AddViewModelDelegate : AnyObject {
    func addSuccess()
    func addError(error : String)
}

class AddViewModel : NSObject {
    
    weak var delegate: AddViewModelDelegate?
    
    func addGarment(garmentName: String?) {
        
        guard let name = garmentName, name.count != 0 else {
            delegate?.addError(error: "Please enter garment name!")
            return
        }
        
        CoreDataManager.shared.saveGarment(garment: Garment(name))
        delegate?.addSuccess()
    }
    
}
