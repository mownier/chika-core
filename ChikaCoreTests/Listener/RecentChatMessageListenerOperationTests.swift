//
//  RecentChatMessageListenerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class RecentChatMessageListenerOperationTests: XCTestCase {
    
    var listener: RecentChatMessageListener!
    var operation: RecentChatMessageListenerOperator!
    
    override func setUp() {
        super.setUp()
        
        listener = RecentChatMessageListenerMock()
        operation = RecentChatMessageListenerOperation()
    }
    
    func testStopAllA() {
        let ok = operation.stopAll(using: listener)
        XCTAssertTrue(ok)
    }
    
    func testStopListeningA() {
        var ok = operation.stopListening(using: listener)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).stopListening(using: listener)
        XCTAssertTrue(ok)
    }
    
    func testStartListeningA() {
        let exp = expectation(description: "testStartListeningA")
        let chatID = ID("chat:1")
        let callback: (Result<Chat>) -> Void = { _ in
            exp.fulfill()
        }
        
        var ok = operation.startListening(using: listener)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(chatID).withCallback(callback).startListening(using: listener)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
