//
//  RecentChatMessageListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class RecentChatMessageListenerMock: RecentChatMessageListener {

    func stopAll() -> Bool {
        return true
    }
    
    func stopListening(on chatID: ID) -> Bool {
        return true
    }
    
    func startListening(on chatID: ID, callback: @escaping (Result<Chat>) -> Void) -> Bool {
        callback(.ok(Chat()))
        return true
    }
}
