//
//  ChatQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ChatQueryOperationTests: XCTestCase {
    
    func testGetChatsA() {
        let query = ChatQueryMock()
        let operation = ChatQueryOperation()
        
        var ok = operation.getChats(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withChatIDs([]).getChats(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetChatsB() {
        let exp = expectation(description: "testGetChatsB")
        let query = ChatQueryMock()
        let operation = ChatQueryOperation()
        let completion: (Result<[Chat]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withChatIDs([]).withCompletion(completion).getChats(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
