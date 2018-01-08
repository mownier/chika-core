//
//  PasswordUpdaterOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PasswordUpdaterOperationTests: XCTestCase {
    
    func testUpdatePasswordA() {
        let updater = PasswordUpdaterMock()
        let operation = PasswordUpdaterOperation()
        var ok = operation.updatePassword(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewPassword("me1234").updatePassword(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withCurrentEmail("me@me.com").updatePassword(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withCurrentPassword("me12345").updatePassword(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewPassword("me1234").withCurrentEmail("me@me.com").updatePassword(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewPassword("me1234").withCurrentPassword("me12345").updatePassword(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withCurrentEmail("me@me.com").withCurrentPassword("me12345").updatePassword(using: updater)
        XCTAssertFalse(ok)
    }
    
    func testUpdatePasswordB() {
        let exp = expectation(description: "testUpdatePasswordB")
        let updater = PasswordUpdaterMock()
        let operation = PasswordUpdaterOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withNewPassword("me12345").withCurrentEmail("me@me.com").withCurrentPassword("me12345").withCompletion(completion).updatePassword(using: updater)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
