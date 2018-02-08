//
//  ChatParticipantPresenceListenerObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class ChatParticipantPresenceListenerObjectTests: XCTestCase {

    func testHashValueA() {
        let id1 = ID("chat:1")
        let id2 = ID("chat:2")
        let id3 = ID("chat:1")
        
        let object1 = ChatParticipantPresenceListenerObject(chatID: id1, presence: Presence())
        let object2 = ChatParticipantPresenceListenerObject(chatID: id2, presence: Presence())
        let object3 = ChatParticipantPresenceListenerObject(chatID: id3, presence: Presence())
        
        var info = [ChatParticipantPresenceListenerObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
}
