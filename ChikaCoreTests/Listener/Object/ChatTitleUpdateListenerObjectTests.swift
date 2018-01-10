//
//  ChatTitleUpdateListenerObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ChatTitleUpdateListenerObjectTests: XCTestCase {
    
    func testHashValueA() {
        let chat1ID = ID("chat:1")
        let chat2ID = ID("chat:2")
        let chat3ID = ID("chat:1")
        
        let object1 = ChatTitleUpdateListenerObject(chatID: chat1ID, title: "chat:1:title")
        let object2 = ChatTitleUpdateListenerObject(chatID: chat2ID, title: "chat:2:title")
        let object3 = ChatTitleUpdateListenerObject(chatID: chat3ID, title: "chat:3:title")
        
        var info = [ChatTitleUpdateListenerObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
    
}
