//
//  AddViewModelTest.swift
//  IOSDemoCoreDataTests
//
//  Created by Duy Thien Chau on 4/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

import XCTest
@testable import IOSDemoCoreData

class AddVCMock : AddViewModelDelegate {
    
    var expectation: XCTestExpectation?
    
    init(_ expectaion : XCTestExpectation) {
        self.expectation = expectaion
    }
    
    func addSuccess() {
    }
    
    func addError(error: String) {
        XCTAssertEqual(error, "Please enter garment name!")
        expectation?.fulfill()
    }
    
}

class AddViewModelTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        CoreDataManager.shared.deleteAll()
    }
    
    func testAddEmptyName() throws {

        let exp = expectation(description: "Expectation Adding Failed")
        
        let addVCMock = AddVCMock(exp)
        let viewModel = AddViewModel()
        viewModel.delegate = addVCMock
        
        viewModel.addGarment(garmentName: "")
        
        waitForExpectations(timeout: 1.0)
    }

}
