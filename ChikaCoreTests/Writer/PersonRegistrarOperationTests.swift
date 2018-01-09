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
        let registrar = PersonRegistrarMock()
        let operation = PersonRegistrarOperation()
        
        var ok = operation.registerPerson(using: registrar)
        XCTAssertFalse(ok)
        
        ok = operation.withEmail("me@me.com").registerPerson(using: registrar)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonID(ID("person:1")).registerPerson(using: registrar)
        XCTAssertFalse(ok)
        
        ok = operation.withEmail("me@me.com").withPersonID(ID("person:1")).registerPerson(using: registrar)
        XCTAssertTrue(ok)
    }
    
    func testRegisterPersonB() {
        let exp = expectation(description: "testRegisterPersonB")
        let registrar = PersonRegistrarMock()
        let operation = PersonRegistrarOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withEmail("me@me.com").withPersonID(ID("person:1")).withCompletion(completion).registerPerson(using: registrar)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
