//
//  RecentChatListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class RecentChatListenerMock: RecentChatListener {

    func stopListening() -> Bool {
        return true
    }
    
    func startListening(withCallback callback: @escaping (Result<Chat>) -> Void) -> Bool {
        callback(.ok(Chat()))
        return true
    }
}
