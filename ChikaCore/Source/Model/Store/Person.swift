//
//  Person.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Person: Hashable, Unique {

    private var aDisplayName: String = ""
    
    public var id: ID
    public var name: String
    public var email: String
    public var avatarURL: String
    
    public var displayName: String {
        set {
            aDisplayName = newValue
        }
        get {
            if aDisplayName.isEmpty {
                return name
            }
            return aDisplayName
        }
    }

    public init() {
        self.id = ID("")
        self.name = ""
        self.avatarURL = ""
        self.email = ""
        self.displayName = ""
    }
    
    public var hashValue: Int {
        return id.hashValue
    }
    
    public static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
    
    public struct SearchObject: Hashable {
        
        public var chat: Chat
        public var person: Person
        public var isContact: Bool
        public var isPending: Bool
        public var isRequested: Bool
        
        public init() {
            self.chat = Chat()
            self.person = Person()
            self.isContact = false
            self.isPending = false
            self.isRequested = false
        }
        
        public var hashValue: Int {
            return person.hashValue
        }
        
        public static func ==(lhs: SearchObject, rhs: SearchObject) -> Bool {
            return lhs.person == rhs.person
        }
    }
}
