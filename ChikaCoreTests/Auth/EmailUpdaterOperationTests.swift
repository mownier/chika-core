//
//  EmailUpdaterOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class EmailUpdaterOperationTests: XCTestCase {
    
    func testUpdateEmailA() {
        let updater = EmailUpdaterMock()
        let operation = EmailUpdaterOperation()
        var ok = operation.updateEmail(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewEmail("me@me.com").updateEmail(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withCurrentEmail("me@me.com").updateEmail(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withCurrentPassword("me12345").updateEmail(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewEmail("you@you.com").withCurrentEmail("me@me.com").updateEmail(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewEmail("you@you.com").withCurrentPassword("me12345").updateEmail(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withCurrentEmail("me@me.com").withCurrentPassword("me12345").updateEmail(using: updater)
        XCTAssertFalse(ok)
    }
    
    func testUpdateEmailB() {
        let exp = expectation(description: "testUpdateEmailB")
        let updater = EmailUpdaterMock()
        let operation = EmailUpdaterOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withNewEmail("you@you.com").withCurrentEmail("me@me.com").withCurrentPassword("me12345").withCompletion(completion).updateEmail(using: updater)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
