//
//  RecentChatMessageListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct RecentChatMessageListenerObject: Hashable {
    
    public internal(set) var chatID: ID
    public internal(set) var message: Message
    
    public init(chatID: ID, message: Message) {
        self.chatID = chatID
        self.message = message
    }
    
    public var hashValue: Int {
        return chatID.hashValue
    }
    
    public static func ==(lhs: RecentChatMessageListenerObject, rhs: RecentChatMessageListenerObject) -> Bool {
        return lhs.chatID == rhs.chatID
    }
}


