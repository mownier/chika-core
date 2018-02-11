//
//  SeenMessageMarkerOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/11/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class SeenMessageMarkerOperationTests: XCTestCase {
    
    var marker: SeenMessageMarker!
    var operation: SeenMessageMarkerOperation!
    
    override func setUp() {
        super.setUp()
        
        marker = SeenMessageMarkerMock()
        operation = SeenMessageMarkerOperation()
    }
    
    func testMarkMessageAsSeenA() {
        var ok = operation.markMessageAsSeen(using: marker)
        XCTAssertFalse(ok)
        
        ok = operation.withMessageID(ID("message:1")).markMessageAsSeen(using: marker)
        XCTAssertTrue(ok)
    }
    
    func testMarkMessageAsSeenB() {
        let exp = expectation(description: "testMarkMessageAsSeenB")
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.withMessageID(ID("message:1")).withCompletion(completion).markMessageAsSeen(using: marker)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
