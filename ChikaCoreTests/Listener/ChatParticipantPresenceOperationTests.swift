//
//  ChatParticipantPresenceOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class ChatParticipantPresenceOperationTests: XCTestCase {
    
    var listener: ChatParticipantPresenceListener!
    var operation: ChatParticipantPresenceListenerOperation!
    
    override func setUp() {
        super.setUp()
        
        listener = ChatParticipantPresenceListenerMock()
        operation = ChatParticipantPresenceListenerOperation()
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
        let exp = expectation(description: "testStopListeningA")
        let chatID = ID("chat:1")
        let callback: (Result<Presence>) -> Void = { _ in
            exp.fulfill()
        }
        
        var ok = operation.startListening(using: listener)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(chatID).withCallback(callback).startListening(using: listener)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
