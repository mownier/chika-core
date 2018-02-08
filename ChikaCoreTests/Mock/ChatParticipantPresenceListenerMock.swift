//
//  ChatParticipantPresenceListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ChatParticipantPresenceListenerMock: ChatParticipantPresenceListener {
    
    func stopAll() -> Bool {
        return true
    }
    
    func stopListening(on chatID: ID) -> Bool {
        return true
    }
    
    func startListening(on chatID: ID, callback: @escaping (Result<Presence>) -> Void) -> Bool {
        callback(.ok(Presence()))
        return true
    }
    
}
