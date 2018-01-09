//
//  RecentChatMessageQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class RecentChatMessageQueryOperationTests: XCTestCase {
    
    func testGetRecentChatMessageA() {
        let query = RecentChatMessageQueryMock()
        let operation = RecentChatMessageOperation()
        let chatID = ID("chat:1")
        
        var ok = operation.getRecentChatMessage(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(chatID).getRecentChatMessage(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetRecentChatMessageB() {
        let exp = expectation(description: "testGetRecentChatMessageB")
        let query = RecentChatMessageQueryMock()
        let chatID = ID("")
        let operation = RecentChatMessageOperation()
        let completion: (Result<Message>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withChatID(chatID).withCompletion(completion).getRecentChatMessage(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
