//
//  Process.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/23/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol Cancelable {
    
    @discardableResult
    func cancel() -> Bool
}


public protocol Resumable {
    
    @discardableResult
    func resume() -> Bool
}


public protocol Pauseable {
    
    @discardableResult
    func cancel() -> Bool
}
