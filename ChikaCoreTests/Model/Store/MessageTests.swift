//
//  MessageTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class MessageTests: XCTestCase {
    
    func testHashValueA() {
        var message1 = Message()
        var message2 = Message()
        var message3 = Message()
        message1.id = ID("message:1")
        message2.id = ID("message:2")
        message3.id = ID("message:1")
        
        var info = [Message: Bool]()
        info[message1] = true
        info[message2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[message3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[message1], false)
    }
    
}
