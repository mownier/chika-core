//
//  UnreadChatMessageCountQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class UnreadChatMessageCountQueryOperationTests: XCTestCase {
    
    var query: UnreadChatMessageCountQuery!
    var operation: UnreadChatMessageCountQueryOperation!
    
    override func setUp() {
        super.setUp()
        
        query = UnreadChatMessageCountQueryMock()
        operation = UnreadChatMessageCountQueryOperation()
    }
    
    func testGetUnreadChatMessageCountA() {
        var ok = operation.getUnreadChatMessageCount(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).getUnreadChatMessageCount(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetUnreadChatMessageCountB() {
        let exp = expectation(description: "testGetUnreadChatMessageCountB")
        let completion: (Result<UInt>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withChatID(ID("chat:1")).withCompletion(completion).getUnreadChatMessageCount(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
