//
//  RecentChatMessageListenerObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class RecentChatMessageListenerObjectTests: XCTestCase {
    
    func testHashValueA() {
        let chat1ID = ID("chat:1")
        let chat2ID = ID("chat:2")
        let chat3ID = ID("chat:1")
        
        let object1 = RecentChatMessageListenerObject(chatID: chat1ID, message: Message())
        let object2 = RecentChatMessageListenerObject(chatID: chat2ID, message: Message())
        let object3 = RecentChatMessageListenerObject(chatID: chat3ID, message: Message())
        
        var info = [RecentChatMessageListenerObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
    
}
