//
//  IOSDemoCoreDataTests.swift
//  IOSDemoCoreDataTests
//
//  Created by Duy Thien Chau on 4/29/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import XCTest
@testable import IOSDemoCoreData

class DatabaseTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        CoreDataManager.shared.deleteAll()
    }

    func testSave() throws {
        let name = "Dress"
        
        CoreDataManager.shared.saveGarment(garment: Garment(name))
        
        let garments = CoreDataManager.shared.getGarment(sortStrategy: SortByName())
        
        if garments.count == 0 {
            XCTFail("Data is empty")
        } else {
            XCTAssertEqual(garments[0].name, name, "Insert wrong garment name")
        }
    }
    
    func testSortByName() throws {
        let pant = "Pant"
        let dress = "Dress"
        
        CoreDataManager.shared.saveGarment(garment: Garment(pant))
        CoreDataManager.shared.saveGarment(garment: Garment(dress))
        
        let garments = CoreDataManager.shared.getGarment(sortStrategy: SortByName())
        
        if garments.count != 2 {
            XCTFail("Data is not correct")
        } else {
            XCTAssertEqual(garments[0].name, dress, "Wrong order")
            XCTAssertEqual(garments[1].name, pant, "Wrong order")
        }
    }
    
    func testSortByDate() throws {
        let pant = "Pant"
        let dress = "Dress"
        
        CoreDataManager.shared.saveGarment(garment: Garment(pant))
        CoreDataManager.shared.saveGarment(garment: Garment(dress))
        
        let garments = CoreDataManager.shared.getGarment(sortStrategy: SortByDate())
        
        if garments.count != 2 {
            XCTFail("Data is not correct")
        } else {
            XCTAssertEqual(garments[0].name, pant, "Wrong order")
            XCTAssertEqual(garments[1].name, dress, "Wrong order")
        }
    }
}
