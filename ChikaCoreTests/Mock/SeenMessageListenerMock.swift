//
//  SeenMessageListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class SeenMessageListenerMock: SeenMessageListener {

    func stopAll() -> Bool {
        return true
    }
    
    func stopListening(on messageID: ID) -> Bool {
        return true
    }
    
    func startListening(on messageID: ID, callback: @escaping (Result<SeenMessageListenerObject>) -> Void) -> Bool {
        let object = SeenMessageListenerObject(messageID: ID("message:1"), participant: Person())
        callback(.ok(object))
        return true
    }
    
}
