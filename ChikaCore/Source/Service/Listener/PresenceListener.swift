//
//  PresenceListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PresenceListener {

    func stopAll() -> Bool
    func stopListening(on personID: ID) -> Bool
    func startListening(on personID: ID, callback: @escaping (Result<Presence>) -> Void) -> Bool
}

public protocol PresenceListenerOperator {
    
    func withPersonID(_ id: ID) -> PresenceListenerOperator
    func withCallback(_ callback: @escaping (Result<Presence>) -> Void) -> PresenceListenerOperator
    
    func stopAll(using listener: PresenceListener) -> Bool
    func stopListening(using listener: PresenceListener) -> Bool
    func startListening(using listener: PresenceListener) -> Bool
}

public class PresenceListenerOperation: PresenceListenerOperator {
    
    var personID: ID?
    var callback: ((Result<Presence>) -> Void)?
    
    public init() {
    }
    
    public func withPersonID(_ id: ID) -> PresenceListenerOperator {
        personID = id
        return self
    }
    
    public func withCallback(_ aCallback: @escaping (Result<Presence>) -> Void) -> PresenceListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopAll(using listener: PresenceListener) -> Bool {
        defer {
            cleanUp()
        }
        
        return listener.stopAll()
    }
    
    public func stopListening(using listener: PresenceListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard personID != nil else {
            return false
        }
        
        return listener.stopListening(on: personID!)
    }
    
    public func startListening(using listener: PresenceListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard personID != nil else {
            return false
        }
        
        let block = callback
        let ok = listener.startListening(on: personID!) { result in
            block?(result)
        }
        return ok
    }
    
    func cleanUp() {
        personID = nil
        callback = nil
    }
}
