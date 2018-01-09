//
//  OKTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class OKTests: XCTestCase {
    
    func testHashValueA() {
        let ok1 = OK("no problem")
        let ok2 = OK("smooth execution")
        let ok3 = OK("no problem")
        
        var info = [OK: Bool]()
        info[ok1] = true
        info[ok2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[ok3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[ok1], false)
    }
    
    func testDescriptionA() {
        let ok = OK("no problem")
        XCTAssertEqual("no problem", "\(ok)")
    }
    
}
