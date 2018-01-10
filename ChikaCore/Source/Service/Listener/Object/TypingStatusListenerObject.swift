//
//  TypingStatusListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct TypingStatusListenerObject: Hashable {
    
    public internal(set) var status: TypingStatus
    public internal(set) var personID: ID
    
    public init(personID: ID, status: TypingStatus) {
        self.status = status
        self.personID = personID
    }
    
    public var hashValue: Int {
        return personID.hashValue
    }
    
    public static func ==(lhs: TypingStatusListenerObject, rhs: TypingStatusListenerObject) -> Bool {
        return lhs.personID == rhs.personID
    }
}
