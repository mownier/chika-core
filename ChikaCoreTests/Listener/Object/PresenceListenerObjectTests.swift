//
//  PresenceListenerObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PresenceListenerObjectTests: XCTestCase {
    
    func testHashValueA() {
        let person1ID = ID("person:1")
        let person2ID = ID("person:2")
        let person3ID = ID("person:1")
        
        let object1 = PresenceListenerObject(personID: person1ID, presence: Presence())
        let object2 = PresenceListenerObject(personID: person2ID, presence: Presence())
        let object3 = PresenceListenerObject(personID: person3ID, presence: Presence())
        
        var info = [PresenceListenerObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
    
}
