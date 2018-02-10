//
//  SeenMessageListenerObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class SeenMessageListenerObjectTests: XCTestCase {
    
    func testHashValueB() {
        let message1 = ID("message:1")
        let message2 = ID("message:2")
        let message3 = ID("message:1")
        
        var person1 = Person()
        var person2 = Person()
        var person3 = Person()
        
        person1.id = ID("person:1")
        person2.id = ID("person:2")
        person3.id = ID("person:1")
        
        let object1 = SeenMessageListenerObject(messageID: message1, participant: person1)
        let object2 = SeenMessageListenerObject(messageID: message2, participant: person2)
        let object3 = SeenMessageListenerObject(messageID: message3, participant: person3)
        
        var info = [SeenMessageListenerObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
    
}
