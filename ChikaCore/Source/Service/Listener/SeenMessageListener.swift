//
//  SeenMessageListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol SeenMessageListener {
    
    @discardableResult
    func stopAll() -> Bool
    
    @discardableResult
    func stopListening(on messageID: ID) -> Bool
    
    @discardableResult
    func startListening(on messageID: ID, callback: @escaping (Result<SeenMessageListenerObject>) -> Void) -> Bool
}

public protocol SeenMessageListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<SeenMessageListenerObject>) -> Void) -> SeenMessageListenerOperator
    func withMessageID(_ id: ID) -> SeenMessageListenerOperator
    
    @discardableResult
    func stopAll(using listener: SeenMessageListener) -> Bool
    
    @discardableResult
    func stopListening(using listener: SeenMessageListener) -> Bool
    
    @discardableResult 
    func startListening(using listener: SeenMessageListener) -> Bool
}

public class SeenMessageListenerOperation: SeenMessageListenerOperator {
    
    var callback: ((Result<SeenMessageListenerObject>) -> Void)?
    var messageID: ID?
    
    public init() {
    }
    
    public func withCallback(_ aCallback: @escaping (Result<SeenMessageListenerObject>) -> Void) -> SeenMessageListenerOperator {
        callback = aCallback
        return self
    }
    
    public func withMessageID(_ id: ID) -> SeenMessageListenerOperator {
        messageID = id
        return self
    }
    
    @discardableResult
    public func stopAll(using listener: SeenMessageListener) -> Bool {
        defer {
            cleanUp()
        }
        
        return listener.stopAll()
    }
    
    @discardableResult
    public func stopListening(using listener: SeenMessageListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard messageID != nil else {
            return false
        }
        
        return listener.stopListening(on: messageID!)
    }
    
    @discardableResult
    public func startListening(using listener: SeenMessageListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard messageID != nil else {
            return false
        }
        
        let block = callback
        let ok = listener.startListening(on: messageID!) { result in
            block?(result)
        }
        return ok
    }
    
    func cleanUp() {
        callback = nil
        messageID = nil
    }
    
}

