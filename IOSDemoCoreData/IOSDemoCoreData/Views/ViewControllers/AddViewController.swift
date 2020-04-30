//
//  AddViewController.swift
//  IOSDemoCoreData
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func added()
}

class AddViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    weak var delegate: AddViewControllerDelegate?
    
    fileprivate var viewModel: AddViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AddViewModel()
        viewModel?.delegate = self
        
        txtName.becomeFirstResponder()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        viewModel?.addGarment(garmentName: txtName.text)
    }
}

extension AddViewController: AddViewModelDelegate {
    
    func addSuccess() {
        delegate?.added()
        dismiss(animated: true, completion: nil)
    }
    
    func addError(error: String) {
        Alert.showError(on: self, content: error)
    }
    
}
