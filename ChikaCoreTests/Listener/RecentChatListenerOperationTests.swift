//
//  RecentChatListenerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class RecentChatListenerOperationTests: XCTestCase {
    
    var listener: RecentChatListener!
    var operation: RecentChatListenerOperator!
    
    override func setUp() {
        super.setUp()
        
        listener = RecentChatListenerMock()
        operation = RecentChatListenerOperation()
    }
    
    func testStopListeningA() {
        let ok = operation.stopListening(using: listener)
        XCTAssertTrue(ok)
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
    
}
