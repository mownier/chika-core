//
//  PresenceListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class PresenceListenerMock: PresenceListener {

    func stopAll() -> Bool {
        return true
    }
    
    func stopListening(on personID: ID) -> Bool {
        return true
    }
    
    func startListening(on personID: ID, callback: @escaping (Result<Presence>) -> Void) -> Bool {
        let presence = Presence()
        callback(.ok(presence))
        return true
    }
}
