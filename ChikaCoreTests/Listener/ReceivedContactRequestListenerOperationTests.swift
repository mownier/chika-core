//
//  ReceivedContactRequestListenerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ReceivedContactRequestListenerOperationTests: XCTestCase {
    
    var listener: ReceivedContactRequestListener!
    var operation: ReceivedContactRequestListenerOperator!
    
    override func setUp() {
        super.setUp()
        
        listener = ReceivedContactRequestListenerMock()
        operation = ReceivedContactRequestListenerOperation()
    }
    
    func testStopListeningA() {
        let ok = operation.stopListening(using: listener)
        XCTAssertTrue(ok)
    }
    
    func testStartListeningA() {
        let exp = expectation(description: "testStartListeningA")
        let callback: (Result<Contact.Request>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCallback(callback).startListening(using: listener)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
