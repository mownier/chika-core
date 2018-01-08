//
//  SignInOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class SignInOperationTests: XCTestCase {
    
    func testSignInA() {
        let mock = SignInMock()
        let operation = SignInOperation()
        var ok = operation.withEmail("me@me.com").signIn(using: mock)
        XCTAssertFalse(ok)
        
        ok = operation.withPassword("me12345").signIn(using: mock)
        XCTAssertFalse(ok)
        
        ok = operation.withEmail("me@me.com").withPassword("me12345").signIn(using: mock)
        XCTAssertTrue(ok)
    }
    
    func testSignInB() {
        let exp = expectation(description: "testSignInB")
        let mock = SignInMock()
        let operation = SignInOperation()
        let completion: (Result<Auth>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withEmail("me@me.com").withPassword("me12345").withCompletion(completion).signIn(using: mock)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
