//
//  TypingStatusListenerObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class TypingStatusListenerObjectTests: XCTestCase {
    
    func testHashValueA() {
        var person1 = Person()
        var person2 = Person()
        var person3 = Person()
        
        person1.id = ID("person:1")
        person2.id = ID("person:2")
        person3.id = ID("person:1")
        
        let object1 = TypingStatusListenerObject(person: person1, status: .typing)
        let object2 = TypingStatusListenerObject(person: person2, status: .typing)
        let object3 = TypingStatusListenerObject(person: person3, status: .typing)
        
        var info = [TypingStatusListenerObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
    
}
