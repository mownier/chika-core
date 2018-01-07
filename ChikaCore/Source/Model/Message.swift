//
//  Message.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Message: Hashable, Unique {

    public var id: ID
    public var date: Date
    public var author: Person
    public var content: String
    
    public init() {
        self.id = ID("")
        self.date = Date()
        self.author = Person()
        self.content = ""
    }
    
    public var hashValue: Int {
        return id.hashValue
    }
    
    public static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
}
