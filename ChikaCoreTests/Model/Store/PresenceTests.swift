//
//  PresenceTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PresenceTests: XCTestCase {
    
    func testInit() {
        let presence = Presence()
        XCTAssertEqual(false, presence.isActive)
    }
    
}
