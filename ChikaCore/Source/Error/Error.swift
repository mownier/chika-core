//
//  Error.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Error: Swift.Error, Hashable, CustomStringConvertible {

    public let message: String
    
    public init(_ message: String) {
        self.message = message
    }
    
    public var description: String {
        return message
    }
    
    public var hashValue: Int {
        return message.hashValue
    }
    
    public static func ==(lhs: Error, rhs: Error) -> Bool {
        return lhs.message == rhs.message
    }
}
