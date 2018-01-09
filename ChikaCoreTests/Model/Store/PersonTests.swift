//
//  PersonTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PersonTests: XCTestCase {
    
    func testHashValueA() {
        var person1 = Person()
        var person2 = Person()
        var person3 = Person()
        person1.id = ID("person:1")
        person2.id = ID("person:2")
        person3.id = ID("person:1")
        
        var info = [Person: Bool]()
        info[person1] = true
        info[person2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[person3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[person1], false)
    }
    
    func testDisplayNameA() {
        var person = Person()
        
        person.displayName = "wee"
        XCTAssertEqual("wee", person.displayName)
    
        person.displayName = ""
        person.name = "iamwee"
        XCTAssertEqual("iamwee", person.displayName)
        
        person.displayName = "waa"
        person.name = "iamwaa"
        XCTAssertEqual("waa", person.displayName)
    }
    
}
