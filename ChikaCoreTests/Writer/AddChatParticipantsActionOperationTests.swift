//
//  AddChatParticipantsActionOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import ChikaCore

class AddChatParticipantsActionOperationTests: XCTestCase {
    
    func testAddChatParticipantsA() {
        let action = AddChatParticipantsActionMock()
        let operation = AddChatParticipantsActionOperation()
        
        var ok = operation.addChatParticipants(using: action)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).addChatParticipants(using: action)
        XCTAssertFalse(ok)
        
        ok = operation.withPersonIDs([]).addChatParticipants(using: action)
        XCTAssertFalse(ok)
        
        ok = operation.withChatID(ID("chat:1")).withPersonIDs([]).addChatParticipants(using: action)
        XCTAssertTrue(ok)
    }
    
    func testAddChatParticipantsB() {
        let exp = expectation(description: "testAddChatParticipantsB")
        let action = AddChatParticipantsActionMock()
        let operation = AddChatParticipantsActionOperation()
        let completion: (Result<[ID]>) -> Void = { _ in
            exp.fulfill()
        }
        
        let ok = operation.withChatID(ID("chat:1")).withPersonIDs([]).withCompletion(completion).addChatParticipants(using: action)
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
