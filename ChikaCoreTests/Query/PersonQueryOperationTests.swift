//
//  PersonQueryOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PersonQueryOperationTests: XCTestCase {
    
    func testGetPersonsA() {
        let query = PersonQueryMock()
        let operation = PersonQueryOperation()
        
        var ok = operation.getPersons(using: query)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonIDs([]).getPersons(using: query)
        XCTAssertTrue(ok)
    }
    
    func testGetPersonsB() {
        let exp = expectation(description: "testGetPersonsB")
        let query = PersonQueryMock()
        let operation = PersonQueryOperation()
        let completion: (Result<[Person]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withPersonIDs([]).withCompletion(completion).getPersons(using: query)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
