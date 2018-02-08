//
//  ChatParticipantPresenceListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatParticipantPresenceListener {

    func stopAll() -> Bool
    func stopListening(on chatID: ID) -> Bool
    func startListening(on chatID: ID, callback: @escaping (Result<Presence>) -> Void) -> Bool
}

public protocol ChatParticipantPresenceListenerOperator {
    
    func withChatID(_ id: ID) -> ChatParticipantPresenceListenerOperator
    func withCallback(_ callback: @escaping (Result<Presence>) -> Void) -> ChatParticipantPresenceListenerOperator
    
    func stopAll(using listener: ChatParticipantPresenceListener) -> Bool
    func stopListening(using listener: ChatParticipantPresenceListener) -> Bool
    func startListening(using listener: ChatParticipantPresenceListener) -> Bool
}

public class ChatParticipantPresenceListenerOperation: ChatParticipantPresenceListenerOperator {
    
    var chatID: ID?
    var callback: ((Result<Presence>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> ChatParticipantPresenceListenerOperator {
        chatID = id
        return self
    }
    
    public func withCallback(_ aCallback: @escaping (Result<Presence>) -> Void) -> ChatParticipantPresenceListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopAll(using listener: ChatParticipantPresenceListener) -> Bool {
        defer {
            cleanUp()
        }
        
        return listener.stopAll()
    }
    
    public func stopListening(using listener: ChatParticipantPresenceListener) -> Bool {
        defer {
            cleanUp()
        }
        
        guard chatID != nil else {
            return false
        }
        
        return listener.stopListening(on: chatID!)
    }
    
    public func startListening(using listener: ChatParticipantPresenceListener) -> Bool {
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
