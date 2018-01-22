//
//  PersonRegistrarOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PersonRegistrarOperationTests: XCTestCase {
    
    func testRegisterPersonA() {
        let exp = expectation(description: "testRegisterPersonA")
        let registrar = PersonRegistrarMock()
        let operation = PersonRegistrarOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCompletion(completion).registerPerson(using: registrar)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
