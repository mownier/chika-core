//
//  IDTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class IDTests: XCTestCase {
    
    func testDescriptionA() {
        let id = ID("chat:1")
        XCTAssertEqual("chat:1", "\(id)")
    }
    
}
