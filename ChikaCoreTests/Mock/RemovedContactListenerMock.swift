//
//  RemovedContactListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class RemovedContactListenerMock: RemovedContactListener {

    func stopListening() -> Bool {
        return true
    }
    
    func startListening(withCallback callback: @escaping (Result<ID>) -> Void) -> Bool {
        callback(.ok(ID("person:1")))
        return true
    }
}
