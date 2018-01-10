//
//  ReceivedContactRequestListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ReceivedContactRequestListenerMock: ReceivedContactRequestListener {

    func stopListening() -> Bool {
        return true
    }
    
    func startListening(withCallback callback: @escaping (Result<Contact.Request>) -> Void) -> Bool {
        callback(.ok(Contact.Request()))
        return true
    }
}
