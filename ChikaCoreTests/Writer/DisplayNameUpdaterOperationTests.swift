//
//  DisplayNameUpdaterOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class DisplayNameUpdaterOperationTests: XCTestCase {
    
    var updater: DisplayNameUpdater!
    var operation: DisplayNameUpdaterOperation!
    
    override func setUp() {
        super.setUp()
        
        updater = DisplayNameUpdaterMock()
        operation = DisplayNameUpdaterOperation()
    }
    
    func testUpdateDisplayNameA() {
        var ok = operation.updateDisplayName(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewValue("display:name").updateDisplayName(using: updater)
        XCTAssertTrue(ok)
    }
    
    func testUpdateDisplayNameB() {
        let exp = expectation(description: "testUpdateDisplayNameB")
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withNewValue("display:name").withCompletion(completion).updateDisplayName(using: updater)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
