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
        let action = IgnoreContactRequestActionMock()
        let operation = IgnoreContactRequestActionOperation()
        
        var ok = operation.acceptContactRequest(using: action)
        XCTAssertFalse(ok)
        
        ok = operation.withContactRequestID(ID("contact:request:1")).acceptContactRequest(using: action)
        XCTAssertTrue(ok)
    }
    
    func testIgnoreContactRequestB() {
        let exp = expectation(description: "testIgnoreContactRequestB")
        let action = IgnoreContactRequestActionMock()
        let operation = IgnoreContactRequestActionOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withContactRequestID(ID("contact:request:1")).withCompletion(completion).acceptContactRequest(using: action)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
