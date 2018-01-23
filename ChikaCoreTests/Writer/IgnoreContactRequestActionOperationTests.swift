//
//  IgnoreContactRequestActionOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class IgnoreContactRequestActionOperationTests: XCTestCase {
    
    func testIgnoreContactRequestA() {
        let id = ID("contact:request:1")
        let action = IgnoreContactRequestActionMock()
        let operation = IgnoreContactRequestActionOperation()
        
        var ok = operation.ignoreContactRequest(using: action)
        XCTAssertFalse(ok)
        
        ok = operation.withContactRequestID(id).ignoreContactRequest(using: action)
        XCTAssertTrue(ok)
    }
    
    func testIgnoreContactRequestB() {
        let id = ID("contact:request:1")
        let exp = expectation(description: "testIgnoreContactRequestB")
        let action = IgnoreContactRequestActionMock()
        let operation = IgnoreContactRequestActionOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withContactRequestID(id).withCompletion(completion).ignoreContactRequest(using: action)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
