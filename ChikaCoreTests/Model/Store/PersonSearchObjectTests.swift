//
//  PersonSearchObjectTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class PersonSearchObjectTests: XCTestCase {
    
    func testHashValueA() {
        var object1 = Person.SearchObject()
        var object2 = Person.SearchObject()
        var object3 = Person.SearchObject()
        object1.person.id = ID("person:1")
        object2.person.id = ID("person:2")
        object3.person.id = ID("person:1")
        
        var info = [Person.SearchObject: Bool]()
        info[object1] = true
        info[object2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[object3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[object1], false)
    }
    
}
