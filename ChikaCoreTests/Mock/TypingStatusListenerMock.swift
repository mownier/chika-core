//
//  TypingStatusListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class TypingStatusListenerMock: TypingStatusListener {

    func stopAll() -> Bool {
        return true
    }
    
    func stopListening(on chatID: ID) -> Bool {
        return true
    }
    
    func startListening(on chatID: ID, callback: @escaping (Result<TypingStatusListenerObject>) -> Void) -> Bool {
        let object = TypingStatusListenerObject(chatID: chatID, person: Person(), status: .typing)
        callback(.ok(object))
        return true
    }
}
