//
//  ContactQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ContactQueryOperationTests: XCTestCase {
    
    func testGetContactsA() {
        let exp = expectation(description: "testGetContactsA")
        let query = ContactQueryMock()
        let operation = ContactQueryOperation()
        let completion: (Result<[Contact]>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withCompletion(completion).getContacts(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
