//
//  MessageSeenInfoTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class MessageSeenInfoTests: XCTestCase {
    
    func testHashValueA() {
        var info1 = Message.SeenInfo()
        var info2 = Message.SeenInfo()
        var info3 = Message.SeenInfo()
        
        info1.messageID = ID("message:1")
        info2.messageID = ID("message:2")
        info3.messageID = ID("message:1")
        
        var info = [Message.SeenInfo: Bool]()
        info[info1] = true
        info[info2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[info3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[info1], false)
    }
    
}
