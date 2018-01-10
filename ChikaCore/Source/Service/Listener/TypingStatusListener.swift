//
//  TypingStatusListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol TypingStatusListener {

    func stopAll() -> Bool
    func stopListening(on chatID: ID) -> Bool
    func startListening(on chatID: ID, callback: @escaping (Result<TypingStatusListenerObject>) -> Void) -> Bool
}

public protocol TypingStatusListenerOperator {
    
    func withChatID(_ id: ID) -> TypingStatusListenerOperator
    func withCallback(_ callback: @escaping (Result<TypingStatusListenerObject>) -> Void) -> TypingStatusListenerOperator
    
    func stopAll(using listener: TypingStatusListener) -> Bool
    func stopListening(using listener: TypingStatusListener) -> Bool
    func startListening(using listener: TypingStatusListener) -> Bool
}

public class TypingStatusListenerOperation: TypingStatusListenerOperator {
    
    var chatID: ID?
    var callback: ((Result<TypingStatusListenerObject>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> TypingStatusListenerOperator {
        chatID = id
        return self
    }
    
    public func withCallback(_ aCallback: @escaping (Result<TypingStatusListenerObject>) -> Void) -> TypingStatusListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopAll(using listener: TypingStatusListener) -> Bool {
        defer {
            cleanUp()
        }
        
        return listener.stopAll()
    }
    
    public func stopListening(using listener: TypingStatusListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard chatID != nil else {
            return false
        }
        
        return listener.stopListening(on: chatID!)
    }
    
    public func startListening(using listener: TypingStatusListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard chatID != nil else {
            return false
        }
        
        let block = callback
        let ok = listener.startListening(on: chatID!) { result in
            block?(result)
        }
        return ok
    }
    
    func cleanUp() {
        chatID = nil
        callback = nil
    }
}
