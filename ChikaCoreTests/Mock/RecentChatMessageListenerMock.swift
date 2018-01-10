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
    
    func startListening(on chatID: ID, callback: @escaping (Result<RecentChatMessageListenerObject>) -> Void) -> Bool {
        let object = RecentChatMessageListenerObject(chatID: ID("chat:1"), message: Message())
        callback(.ok(object))
        return true
    }
}
