//
//  ChatTitleUpdateListenerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ChatTitleUpdateListenerMock: ChatTitleUpdateListener {

    func stopAll() -> Bool {
        return true
    }
    
    func stopListening(on chatID: ID) -> Bool {
        return true
    }
    
    func startListening(on chatID: ID, callback: @escaping (Result<ChatTitleUpdateListenerObject>) -> Void) -> Bool {
        let object = ChatTitleUpdateListenerObject(chatID: ID("chat:1"), title: "chat:title")
        callback(.ok(object))
        return true
    }
}
