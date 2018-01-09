//
//  ContactTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ContactTests: XCTestCase {
    
    func testHashValueA() {
        var contact1 = Contact()
        var contact2 = Contact()
        var contact3 = Contact()
        contact1.person.id = ID("person:1")
        contact2.person.id = ID("person:2")
        contact3.person.id = ID("person:1")
        
        var info = [Contact: Bool]()
        info[contact1] = true
        info[contact2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[contact3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[contact1], false)
    }
    
}
