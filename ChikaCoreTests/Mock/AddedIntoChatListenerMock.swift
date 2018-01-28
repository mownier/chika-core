//
//  AddedIntoChatListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/28/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class AddedIntoChatListenerMock: AddedIntoChatListener {

    func stopListening() -> Bool {
        return true
    }
    
    func startListening(withCallback callback: @escaping (Result<Chat>) -> Void) -> Bool {
        callback(.ok(Chat()))
        return true
    }
}
