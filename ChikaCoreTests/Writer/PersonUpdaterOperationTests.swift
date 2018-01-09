//
//  PersonUpdaterOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PersonUpdaterOperationTests: XCTestCase {
    
    func testUpdatePersonA() {
        let updater = PersonUpdaterMock()
        let operation = PersonUpdaterOperation()
        
        var ok = operation.updatPerson(using: updater)
        XCTAssertFalse(ok)
        
        ok = operation.withNewValue(Person()).updatPerson(using: updater)
        XCTAssertTrue(ok)
    }
    
    func testUpdatePersonB() {
        let exp = expectation(description: "testUpdatePersonB")
        let updater = PersonUpdaterMock()
        let operation = PersonUpdaterOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withNewValue(Person()).withCompletion(completion).updatPerson(using: updater)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
