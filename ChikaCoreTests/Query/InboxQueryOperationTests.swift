//
//  InboxQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class InboxQueryOperationTests: XCTestCase {
    
    func testGetInboxA() {
        let exp = expectation(description: "testGetInboxA")
        let query = InboxQueryMock()
        let operation = InboxQueryOperation()
        let completion: (Result<[Chat]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCompletion(completion).getInbox(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
