//
//  MessageSeenInfoQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol MessageSeenInfoQuery {

    @discardableResult
    func getMessageSeenInfo(withID id: ID, completion: @escaping (Result<Message.SeenInfo>) -> Void) -> Bool
}

public protocol MessageSeenInfoQueryOperator {
    
    func withMessageID(_ id: ID) -> MessageSeenInfoQueryOperator
    func withCompletion(_ completion: @escaping (Result<Message.SeenInfo>) -> Void) -> MessageSeenInfoQueryOperator
    
    @discardableResult
    func getMessageSeenInfo(using: MessageSeenInfoQuery) -> Bool
}

public class MessageSeenInfoQueryOperation: MessageSeenInfoQueryOperator {
    
    var messageID: ID?
    var completion: ((Result<Message.SeenInfo>) -> Void)?
    
    public init() {
    }
    
    public func withMessageID(_ id: ID) -> MessageSeenInfoQueryOperator {
        messageID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Message.SeenInfo>) -> Void) -> MessageSeenInfoQueryOperator {
        completion = aCompletion
        return self
    }
    
    @discardableResult 
    public func getMessageSeenInfo(using query: MessageSeenInfoQuery) -> Bool {
        defer {
            messageID = nil
            completion = nil
        }
        
        guard messageID != nil else {
            return false
        }
        
        let callback = completion
        let ok = query.getMessageSeenInfo(withID: messageID!) { result in
            callback?(result)
        }
        return ok
    }
    
}
