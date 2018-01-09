//
//  ContactRequestTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class ContactRequestTests: XCTestCase {
    
    func testHashValueA() {
        var request1 = Contact.Request()
        var request2 = Contact.Request()
        var request3 = Contact.Request()
        request1.id = ID("contact:request:1")
        request2.id = ID("contact:request:2")
        request3.id = ID("contact:request:1")
        
        var info = [Contact.Request: Bool]()
        info[request1] = true
        info[request2] = true
        
        XCTAssertEqual(info.count, 2)
        
        info[request3] = false
        XCTAssertEqual(info.count, 2)
        XCTAssertEqual(info[request1], false)
    }
    
}
