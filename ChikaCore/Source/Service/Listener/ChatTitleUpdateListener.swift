//
//  ChatTitleUpdateListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatTitleUpdateListener {

    func stopAll() -> Bool
    func stopListening(on chatID: ID) -> Bool
    func startListening(on chatID: ID, callback: @escaping (Result<ChatTitleUpdateListenerObject>) -> Void) -> Bool
}

public protocol ChatTitleUpdateListenerOperator {
    
    func withChatID(_ id: ID) -> ChatTitleUpdateListenerOperator
    func withCallback(_ callback: @escaping (Result<ChatTitleUpdateListenerObject>) -> Void) -> ChatTitleUpdateListenerOperator
    
    func stopAll(using listener: ChatTitleUpdateListener) -> Bool
    func stopListening(using listener: ChatTitleUpdateListener) -> Bool
    func startListening(using listener: ChatTitleUpdateListener) -> Bool
}

public class ChatTitleUpdateListenerOperation: ChatTitleUpdateListenerOperator {
    
    var chatID: ID?
    var callback: ((Result<ChatTitleUpdateListenerObject>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> ChatTitleUpdateListenerOperator {
        chatID = id
        return self
    }
    
    public func withCallback(_ aCallback: @escaping (Result<ChatTitleUpdateListenerObject>) -> Void) -> ChatTitleUpdateListenerOperator {
        callback = aCallback
        return self
    }
    
    public func startListening(using listener: ChatTitleUpdateListener) -> Bool {
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
    
    public func stopListening(using listener: ChatTitleUpdateListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard chatID != nil else {
            return false
        }
        
        let ok = listener.stopListening(on: chatID!)
        return ok
    }
    
    public func stopAll(using listener: ChatTitleUpdateListener) -> Bool {
        defer {
            cleanUp()
        }
        
        return listener.stopAll()
    }
    
    func cleanUp() {
        chatID = nil
        callback = nil
    }
}
