//
//  AddedContactListenerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class AddedContactListenerOperationTests: XCTestCase {
    
    func testStartListeningA() {
        let exp = expectation(description: "testStartListeningA")
        let listener = AddedContactListenerMock()
        let operation = AddedContactListenerOperation()
        
        let callback: (Result<Contact>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCallback(callback).startListening(using: listener)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
    func testStopListeningA() {
        let listener = AddedContactListenerMock()
        let operation = AddedContactListenerOperation()
        let ok = operation.stopListening(using: listener)
        XCTAssertTrue(ok)
    }
}
