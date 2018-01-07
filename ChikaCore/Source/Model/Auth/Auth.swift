//
//  Auth.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Auth {

    public var email: String
    public var personID: ID
    public var accessToken: String
    public var refreshToken: String
    
    public init() {
        self.email = ""
        self.personID = ID("")
        self.accessToken = ""
        self.refreshToken = ""
    }
}
