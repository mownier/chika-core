//
//  OfflinePresenceSwitcherOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class OfflinePresenceSwitcherOperationTests: XCTestCase {
    
    func testSwitchToOfflineA() {
        let exp = expectation(description: "testSwitchToOfflineA")
        let switcher = OfflinePresenceSwitcherMock()
        let operation = OfflinePresenceSwitcherOperation()
        let completion: (Result<OK>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withCompletion(completion).switchToOffline(using: switcher)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
