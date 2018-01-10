//
//  RecentChatMessageListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol RecentChatMessageListener {

    func stopAll() -> Bool
    func stopListening(on chatID: ID) -> Bool
    func startListening(on chatID: ID, callback: @escaping (Result<RecentChatMessageListenerObject>) -> Void) -> Bool
}

public protocol RecentChatMessageListenerOperator {
    
    func withChatID(_ id: ID) -> RecentChatMessageListenerOperator
    func withCallback(_ callback: @escaping (Result<RecentChatMessageListenerObject>) -> Void) -> RecentChatMessageListenerOperator
    
    func stopAll(using listener: RecentChatMessageListener) -> Bool
    func stopListening(using listener: RecentChatMessageListener) -> Bool
    func startListening(using listener: RecentChatMessageListener) -> Bool
}

public class RecentChatMessageListenerOperation: RecentChatMessageListenerOperator {
    
    var chatID: ID?
    var callback: ((Result<RecentChatMessageListenerObject>) -> Void)?
    
    public init(){
    }
    
    public func withChatID(_ id: ID) -> RecentChatMessageListenerOperator {
        chatID = id
        return self
    }
    
    public func withCallback(_ aCallback: @escaping (Result<RecentChatMessageListenerObject>) -> Void) -> RecentChatMessageListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopAll(using listener: RecentChatMessageListener) -> Bool {
        defer {
            cleanUp()
        }
        
        return listener.stopAll()
    }
    
    public func stopListening(using listener: RecentChatMessageListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard chatID != nil else {
            return false
        }
        
        return listener.stopListening(on: chatID!)
    }
    
    public func startListening(using listener: RecentChatMessageListener) -> Bool {
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

