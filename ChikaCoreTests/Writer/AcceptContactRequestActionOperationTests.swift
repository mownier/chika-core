//
//  AcceptContactRequestActionOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class AcceptContactRequestActionOperationTests: XCTestCase {
    
    func testAcceptContactRequestA() {
        let id = ID("contact:request:1")
        let action = AcceptContactRequestActionMock()
        let operation = AcceptContactRequestActionOperation()
        
        var ok = operation.acceptContactRequest(using: action)
        XCTAssertFalse(ok)
        
        ok = operation.withContactRequestID(id).acceptContactRequest(using: action)
        XCTAssertTrue(ok)
    }
    
    func testAcceptContactRequestB() {
        let id = ID("contact:request:1")
        let exp = expectation(description: "testAcceptContactRequestB")
        let action = AcceptContactRequestActionMock()
        let operation = AcceptContactRequestActionOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withContactRequestID(id).withCompletion(completion).acceptContactRequest(using: action)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
