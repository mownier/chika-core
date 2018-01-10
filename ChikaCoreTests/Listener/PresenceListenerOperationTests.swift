//
//  PresenceListenerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PresenceListenerOperationTests: XCTestCase {
    
    var listener: PresenceListener!
    var operation: PresenceListenerOperator!
    
    override func setUp() {
        super.setUp()
        
        listener = PresenceListenerMock()
        operation = PresenceListenerOperation()
    }
    
    func testStopAllA() {
        let ok = operation.stopAll(using: listener)
        XCTAssertTrue(ok)
    }
    
    func testStopListeningA() {
        var ok = operation.stopListening(using: listener)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonID(ID("person:1")).stopListening(using: listener)
        XCTAssertTrue(ok)
    }
    
    func testStartListeningA() {
        let exp = expectation(description: "testStartListeningA")
        let personID = ID("person:1")
        let callback: (Result<PresenceListenerObject>) -> Void = { _ in
            exp.fulfill()
        }
        
        var ok = operation.startListening(using: listener)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonID(personID).withCallback(callback).startListening(using: listener)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
