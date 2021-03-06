//
//  Chat.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Chat: Hashable, Unique {

    public var id: ID
    public var title: String
    public var recent: Message
    public var photoURL: String
    public var creatorID: ID
    public var createdOn: Date
    
    public init() {
        self.id = ID("")
        self.title = ""
        self.recent = Message()
        self.photoURL = ""
        self.creatorID = ID("")
        self.createdOn = Date()
    }
    
    public var hashValue: Int {
        return id.hashValue
    }
    
    public static func ==(lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}
