//
//  ChatTitleUpdaterOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ChatTitleUpdaterOperationTests: XCTestCase {
    
    func testUpdateTitleA() {
        let updater = ChatTitleUpdaterMock()
        let operation = ChatTitleUpdaterOperation()
        
        var ok = operation.updateTitle(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withTitle("chat:title").updateTitle(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).updateTitle(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withTitle("chat:title").withChatID(ID("chat:1")).updateTitle(using: updater)
        XCTAssertTrue(ok)
    }
    
    func testUpdateTitleB() {
        let exp = expectation(description: "testUpdateTitleB")
        let updater = ChatTitleUpdaterMock()
        let operation = ChatTitleUpdaterOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withTitle("chat:title").withChatID(ID("chat:1")).withCompletion(completion).updateTitle(using: updater)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
