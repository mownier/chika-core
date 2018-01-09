//
//  PersonSearchOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PersonSearchOperationTests: XCTestCase {
    
    func testSearchPersonsA() {
        let mock = PersonSearchMock()
        let operation = PersonSearchOperation()
        
        var ok = operation.searchPersons(using: mock)
        XCTAssertFalse(ok)
        
        ok = operation.withKeyword("me").searchPersons(using: mock)
        XCTAssertTrue(ok)
    }
    
    func testSearchPersonsB() {
        let exp = expectation(description: "testSearchPersonsB")
        let mock = PersonSearchMock()
        let operation = PersonSearchOperation()
        let completion: (Result<[Person.SearchObject]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withKeyword("me").withCompletion(completion).searchPersons(using: mock)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
