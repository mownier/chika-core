//
//  ChatParticipantQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/24/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class ChatParticipantQueryOperationTests: XCTestCase {
    
    var query: ChatParticipantQuery!
    var operation: ChatParticipantQueryOperation!
    
    override func setUp() {
        super.setUp()
        
        query = ChatParticipantQueryMock()
        operation = ChatParticipantQueryOperation()
    }
    
    func testGetParticipantsA() {
        var ok = operation.getParticipants(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).getParticipants(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetParticipantsB() {
        let exp = expectation(description: "testGetParticipantsB")
        let chatID = ID("chat:1")
        let completion: (Result<[Person]>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withChatID(chatID).withCompletion(completion).getParticipants(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
