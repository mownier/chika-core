//
//  ErrorTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ErrorTests: XCTestCase {
    
    func testHashValueA() {
        let error1 = Error("something went wrong")
        let error2 = Error("not found")
        let error3 = Error("something went wrong")
        
        var info = [ChikaCore.Error: Bool]()
        info[error1] = true
        info[error2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[error3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[error1], false)
    }
    
    func testDescriptionA() {
        let error1 = Error("not found")
        let error2 = Error("NOt fOund")
        XCTAssertEqual("not found", "\(error1)")
        XCTAssertEqual(error1, error2)
    }
    
}
