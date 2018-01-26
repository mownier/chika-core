//
//  NameUpdaterOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class NameUpdaterOperationTests: XCTestCase {
    
    var updater: NameUpdater!
    var operation: NameUpdaterOperation!
    
    override func setUp() {
        super.setUp()
        
        updater = NameUpdaterMock()
        operation = NameUpdaterOperation()
    }
    
    func testUpdateNameA() {
        var ok = operation.updateName(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewValue(":name").updateName(using: updater)
        XCTAssertTrue(ok)
    }
    
    func testUpdateNameB() {
        let exp = expectation(description: "testUpdateNameB")
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withNewValue(":name").withCompletion(completion).updateName(using: updater)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
