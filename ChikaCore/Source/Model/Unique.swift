//
//  Unique.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol Unique {
    
    var id: ID { set get }
}

public struct ID: Hashable, CustomStringConvertible {
    
    var string: String
    
    public init(_ string: String) {
        self.string = string
    }
    
    public var description: String {
        return string
    }
    
    public var hashValue: Int {
        return string.hashValue
    }
    
    public static func ==(lhs: ID, rhs: ID) -> Bool {
        return lhs.string == rhs.string
    }
}
