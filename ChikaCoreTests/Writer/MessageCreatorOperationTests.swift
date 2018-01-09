//
//  MessageCreatorOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class MessageCreatorOperationTests: XCTestCase {
    
    func testCreateMessageA() {
        let creator = MessageCreatorMock()
        let operation = MessageCreatorOperation()
        
        var ok = operation.createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withContent("message:content").createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withParticipantIDs([]).createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).withContent("message:content").createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).withParticipantIDs([]).createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withContent("message:content").withParticipantIDs([]).createMessage(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).withContent("message:content").withParticipantIDs([]).createMessage(using: creator)
        XCTAssertTrue(ok)
    }
    
    func testCreateMessageB() {
        let exp = expectation(description: "testCreateMessageB")
        let creator = MessageCreatorMock()
        let operation = MessageCreatorOperation()
        let completion: (Result<Message>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withChatID(ID("chat:1")).withContent("message:content").withParticipantIDs([]).withCompletion(completion).createMessage(using: creator)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
