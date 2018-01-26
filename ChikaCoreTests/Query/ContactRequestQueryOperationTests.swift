//
//  ContactRequestQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class ContactRequestQueryOperationTests: XCTestCase {
    
    var query: ContactRequestQuery!
    var operation: ContactRequestQueryOperation!
    
    override func setUp() {
        super.setUp()
        
        query = ContactRequestQueryMock()
        operation = ContactRequestQueryOperation()
    }
    
    func testGetContactRequestsA() {
        let exp = expectation(description: "testGetContactRequestsA")
        let completion: (Result<[Contact.Request]>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withCompletion(completion).getContactRequests(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
