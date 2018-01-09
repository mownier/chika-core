//
//  MessageQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class MessageQueryOperationTests: XCTestCase {
    
    func testGetMessagesA() {
        let query = MessageQueryMock()
        let operation = MessageQueryOperation()
        
        var ok = operation.getMessages(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withMessageIDs([]).getMessages(using: query)
        XCTAssertTrue(ok)
    }

    func testGetMessagesB() {
        let exp = expectation(description: "testGetMessagesB")
        let query = MessageQueryMock()
        let operation = MessageQueryOperation()
        let completion: (Result<[Message]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withMessageIDs([]).withCompletion(completion).getMessages(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
