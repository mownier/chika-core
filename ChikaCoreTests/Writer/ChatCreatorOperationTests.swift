//
//  ChatCreatorOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ChatCreatorOperationTests: XCTestCase {
    
    func testCreateChatA() {
        let creator = ChatCreatorMock()
        let operation = ChatCreatorOperation()
        
        var ok = operation.createChat(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withTitle("chat:title").createChat(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withParticipantIDs([]).createChat(using: creator)
        XCTAssertFalse(ok)
        
        ok = operation.withTitle("chat:title").withParticipantIDs([]).createChat(using: creator)
        XCTAssertTrue(ok)
        
        ok = operation.withTitle("chat:title").withPhotoURL("http://photo/1.png").withParticipantIDs([]).createChat(using: creator)
        XCTAssertTrue(ok)
    }
    
    func testCreateChatB() {
        let exp = expectation(description: "testCreateChatB")
        let creator = ChatCreatorMock()
        let operation = ChatCreatorOperation()
        let completion: (Result<Chat>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withTitle("chat:title").withParticipantIDs([]).withCompletion(completion).createChat(using: creator)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
