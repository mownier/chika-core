//
//  RegistrarOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class RegistrarOperationTests: XCTestCase {
    
    func testRegisterA() {
        let registrar = RegistrarMock()
        let operation = RegistrarOperation()
        var ok = operation.withEmail("me@me.com").register(using: registrar)
        XCTAssertFalse(ok)
        
        ok = operation.withPassword("me12345").register(using: registrar)
        XCTAssertFalse(ok)
        
        ok = operation.withEmail("me@me.com").withPassword("me12345").register(using: registrar)
        XCTAssertTrue(ok)
    }
    
    func testRegisterB() {
        let exp = expectation(description: "testRegisterB")
        let registrar = RegistrarMock()
        let operation = RegistrarOperation()
        let completion: (Result<Auth>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withEmail("me@me.com").withPassword("me12345").withCompletion(completion).register(using: registrar)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
