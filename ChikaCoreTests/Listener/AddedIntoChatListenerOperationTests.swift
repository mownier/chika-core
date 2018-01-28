//
//  AddedIntoChatListenerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/28/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class AddedIntoChatListenerOperationTests: XCTestCase {
    
    var listener: AddedIntoChatListener!
    var operation: AddedIntoChatListenerOperation!
    
    override func setUp() {
        super.setUp()
        
        listener = AddedIntoChatListenerMock()
        operation = AddedIntoChatListenerOperation()
    }
    
    func testStartListeningA() {
        let exp = expectation(description: "testStartListeningA")
        let callback: (Result<Chat>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCallback(callback).startListening(using: listener)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
    func testStopListeningA() {
        let ok = operation.stopListening(using: listener)
        XCTAssertTrue(ok)
    }
    
}
