//
//  Presence.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Presence {
    
    public var activeOn: Date
    public var isActive: Bool
    public var personID: ID
    
    public init() {
        self.activeOn = Date()
        self.isActive = false
        self.personID = ID("")
    }
}
