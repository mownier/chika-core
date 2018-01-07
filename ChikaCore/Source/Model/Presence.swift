//
//  Presence.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Presence {
    
    var activeOn: Date
    var isActive: Bool
    var personID: ID
    
    public init() {
        self.activeOn = Date()
        self.isActive = false
        self.personID = ID("")
    }
}
