//
//  AccessTokenRefresherOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class AccessTokenRefresherOperationTests: XCTestCase {
    
    func testRefreshAccessTokenA() {
        let exp = expectation(description: "testRefreshAccessTokenA")
        let refresher = AccessTokenRefresherMock()
        let operation = AccessTokenRefresherOperation()
        let completion: (Result<Auth>) -> Void =  { _ in
            exp.fulfill()
        }
        let ok = operation.withCompletion(completion).refreshAccessToken(using: refresher)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
}
