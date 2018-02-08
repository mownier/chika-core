//
//  ChatParticipantPresenceListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public class ChatParticipantPresenceListenerObject: Hashable {
    
    public internal(set) var chatID: ID
    public internal(set) var presence: Presence
    
    public init(chatID: ID, presence: Presence) {
        self.chatID = chatID
        self.presence = presence
    }
    
    public var hashValue: Int {
        return chatID.hashValue
    }
    
    public static func ==(lhs: ChatParticipantPresenceListenerObject, rhs: ChatParticipantPresenceListenerObject) -> Bool {
        return lhs.chatID == rhs.chatID
    }
}
