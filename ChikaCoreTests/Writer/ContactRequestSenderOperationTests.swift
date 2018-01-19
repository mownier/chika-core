
//
//  ContactRequestSenderOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ContactRequestSenderOperationTests: XCTestCase {
    
    func testSendContactRequestA() {
        let sender = ContactRequestSenderMock()
        let operation = ContactRequestSenderOperation()
        
        var ok = operation.sendContactRequest(using: sender)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonID(ID("person:1")).sendContactRequest(using: sender)
        XCTAssertFalse(ok)
        
        ok = operation.withMessage("hello").sendContactRequest(using: sender)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonID(ID("person:1")).withMessage("hello").sendContactRequest(using: sender)
        XCTAssertTrue(ok)
    }
    
    func testSendContactRequestB() {
        let exp = expectation(description: "testSendContactRequestB")
        let sender = ContactRequestSenderMock()
        let operation = ContactRequestSenderOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withPersonID(ID("person:1")).withMessage("hello").withCompletion(completion).sendContactRequest(using: sender)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
