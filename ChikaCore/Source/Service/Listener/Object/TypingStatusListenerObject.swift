//
//  TypingStatusListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct TypingStatusListenerObject: Hashable {
    
    public internal(set) var status: TypingStatus
    public internal(set) var person: Person
    
    public init(person: Person, status: TypingStatus) {
        self.status = status
        self.person = person
    }
    
    public var hashValue: Int {
        return person.hashValue
    }
    
    public static func ==(lhs: TypingStatusListenerObject, rhs: TypingStatusListenerObject) -> Bool {
        return lhs.person == rhs.person
    }
}
