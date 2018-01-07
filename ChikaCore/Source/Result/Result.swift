//
//  Result.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public enum Result<T> {

    case ok(T)
    case err(Swift.Error)
}

public struct OK: CustomStringConvertible, Hashable {
    
    var message: String
    
    public init(_ message: String = "OK") {
        self.message = message
    }
    
    public var description: String {
        return message
    }
    
    public var hashValue: Int {
        return message.hashValue
    }
    
    public static func ==(lhs: OK, rhs: OK) -> Bool {
        return lhs.message == rhs.message
    }
}
