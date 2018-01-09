//
//  OnlinePresenceSwitcherOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class OnlinePresenceSwitcherOperationTests: XCTestCase {
    
    func testSwitchToOnlineA() {
        let exp = expectation(description: "testSwitchToOnlineA")
        let switcher = OnlinePresenceSwitcherMock()
        let operation = OnlinePresenceSwitcherOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCompletion(completion).switchToOnline(using: switcher)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
