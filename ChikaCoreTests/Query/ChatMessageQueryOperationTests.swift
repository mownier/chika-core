//
//  ChatMessageQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ChatMessageQueryOperationTests: XCTestCase {
    
    func testGetMessagesA() {
        let query = ChatMessageQueryMock()
        let chatID = ID("chat:1")
        let operation = ChatMessageQueryOperation()
        
        var ok = operation.getMessages(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(chatID).getMessages(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetMessagesB() {
        let exp = expectation(description: "testGetMessagesB")
        let query = ChatMessageQueryMock()
        let chatID = ID("chat:1")
        let operation = ChatMessageQueryOperation()
        let completion: (Result<[Message]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withChatID(chatID).withCompletion(completion).getMessages(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
