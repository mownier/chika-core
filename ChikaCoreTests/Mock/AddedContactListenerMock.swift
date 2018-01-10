//
//  AddedContactListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class AddedContactListenerMock: AddedContactListener {

    func startListening(withCallback callback: @escaping (Result<Contact>) -> Void) -> Bool {
        callback(.ok(Contact()))
        return true
    }
    
    func stopListening() -> Bool {
        return true
    }
}
