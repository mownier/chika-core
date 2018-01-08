//
//  SignOutOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class SignOutOperationTests: XCTestCase {
    
    func testSignOutA() {
        let mock = SignOutMock()
        let operation = SignOutOperation()
        let ok = operation.signOut(using: mock)
        XCTAssertTrue(ok)
    }
    
    func testSignOutB() {
        let exp = expectation(description: "testSignOutB")
        let mock = SignOutMock()
        let operation = SignOutOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withCompletion(completion).signOut(using: mock)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
