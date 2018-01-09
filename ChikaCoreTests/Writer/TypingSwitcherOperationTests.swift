//
//  TypingSwitcherOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class TypingSwitcherOperationTests: XCTestCase {
    
    func testSwitchTypingStatusA() {
        let switcher = TypingSwitcherMock()
        let operation = TypingSwitcherOperation()
        
        var ok = operation.switchTypingStatus(using: switcher)
        XCTAssertFalse(ok)
        
        ok = operation.withNewStatus(.typing).switchTypingStatus(using: switcher)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).switchTypingStatus(using: switcher)
        XCTAssertFalse(ok)
        
        ok = operation.withNewStatus(.typing).withChatID(ID("chat:1")).switchTypingStatus(using: switcher)
        XCTAssertTrue(ok)
    }
    
    func testSwitchTypingStatusB() {
        let exp = expectation(description: "testSwitchTypingStatusB")
        let switcher = TypingSwitcherMock()
        let operation = TypingSwitcherOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withNewStatus(.typing).withChatID(ID("chat:1")).withCompletion(completion).switchTypingStatus(using: switcher)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
