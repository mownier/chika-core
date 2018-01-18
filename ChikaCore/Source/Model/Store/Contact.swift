//
//  Contact.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Contact: Hashable {
    
    public var person: Person
    public var chat: Chat
    
    public init() {
        self.person = Person()
        self.chat = Chat()
    }
    
    public var hashValue: Int {
        return person.hashValue
    }
    
    public static func ==(lhs: Contact, rhs: Contact) -> Bool {
        return lhs.person == rhs.person
    }
    
    public struct Request: Hashable, Unique {
        
        public var id: ID
        public var message: String
        public var requestor: Person
        
        public init() {
            self.id = ID("")
            self.message = ""
            self.requestor = Person()
        }
        
        public var hashValue: Int {
            return id.hashValue
        }
        
        public static func ==(lhs: Request, rhs: Request) -> Bool {
            return lhs.id == rhs.id
        }
    }
}
