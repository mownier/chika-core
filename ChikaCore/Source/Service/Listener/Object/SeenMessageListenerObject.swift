//
//  SeenMessageListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct SeenMessageListenerObject: Hashable {

    public let messageID: ID
    public let participant: Person
    
    public init(messageID: ID, participant: Person) {
        self.messageID = messageID
        self.participant = participant
    }
    
    public var hashValue: Int {
        return messageID.hashValue + participant.hashValue
    }
    
    public static func ==(lhs: SeenMessageListenerObject, rhs: SeenMessageListenerObject) -> Bool {
        return lhs.messageID == rhs.messageID && lhs.participant == rhs.participant
    }
    
}
