//
//  ChatTitleUpdateListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct ChatTitleUpdateListenerObject: Hashable {
    
    public internal(set) var chatID: ID
    public internal(set) var title: String
    
    public init(chatID: ID, title: String) {
        self.chatID = chatID
        self.title = title
    }
    
    public var hashValue: Int {
        return chatID.hashValue
    }
    
    public static func ==(lhs: ChatTitleUpdateListenerObject, rhs: ChatTitleUpdateListenerObject) -> Bool {
        return lhs.chatID == rhs.chatID
    }
}
