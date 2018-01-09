//
//  ChatTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ChatTests: XCTestCase {
    
    func testHashValueA() {
        var chat1 = Chat()
        var chat2 = Chat()
        var chat3 = Chat()
        chat1.id = ID("chat:1")
        chat2.id = ID("chat:2")
        chat3.id = ID("chat:1")
        
        var info = [Chat: Bool]()
        info[chat1] = true
        info[chat2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[chat3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[chat1], false)
    }
    
}
