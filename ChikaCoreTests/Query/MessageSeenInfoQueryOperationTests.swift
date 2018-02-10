//
//  MessageSeenInfoQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class MessageSeenInfoQueryOperationTests: XCTestCase {
    
    var query: MessageSeenInfoQuery!
    var operation: MessageSeenInfoQueryOperation!
    
    override func setUp() {
        super.setUp()
        
        query = MessageSeenInfoQueryMock()
        operation = MessageSeenInfoQueryOperation()
    }
    
    func testGetMessageSeenInfoA() {
        var ok = operation.getMessageSeenInfo(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withMessageID(ID("message:1")).getMessageSeenInfo(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetMessageSeenInfoB() {
        let exp = expectation(description: "testGetMessageSeenInfoB")
        let completion: (Result<Message.SeenInfo>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withMessageID(ID("message:1")).withCompletion(completion).getMessageSeenInfo(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
