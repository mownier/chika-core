//
//  MyInfoQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/15/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class MyInfoQueryOperationTests: XCTestCase {
    
    func testGetMyInfoA() {
        let exp = expectation(description: "testGetMyInfoA")
        let query = MyInfoQueryMock()
        let operation = MyInfoQueryOperation()
        let completion: (Result<Person>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCompletion(completion).getMyInfo(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
