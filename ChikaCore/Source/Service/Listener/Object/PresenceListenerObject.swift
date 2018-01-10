//
//  PresenceListenerObject.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct PresenceListenerObject: Hashable {
    
    public internal(set) var personID: ID
    public internal(set) var presence: Presence
    
    public init(personID: ID, presence: Presence) {
        self.personID = personID
        self.presence = presence
    }
    
    public var hashValue: Int {
        return personID.hashValue
    }
    
    public static func ==(lhs: PresenceListenerObject, rhs: PresenceListenerObject) -> Bool {
        return lhs.personID == rhs.personID
    }
}
