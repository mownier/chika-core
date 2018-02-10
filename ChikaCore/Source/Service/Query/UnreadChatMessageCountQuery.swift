//
//  UnreadChatMessageCountQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol UnreadChatMessageCountQuery {

    @discardableResult
    func getUnreadChatMessageCount(for chatID: ID, completion: @escaping (Result<UInt>) -> Void) -> Bool
}

public protocol UnreadChatMessageCountQueryOperator {
    
    func withChatID(_ id: ID) -> UnreadChatMessageCountQueryOperator
    func withCompletion(_ completion: @escaping (Result<UInt>) -> Void) -> UnreadChatMessageCountQueryOperator
    
    @discardableResult
    func getUnreadChatMessageCount(using: UnreadChatMessageCountQuery) -> Bool
}

public class UnreadChatMessageCountQueryOperation: UnreadChatMessageCountQueryOperator {
    
    var chatID: ID?
    var completion: ((Result<UInt>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> UnreadChatMessageCountQueryOperator {
        chatID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<UInt>) -> Void) -> UnreadChatMessageCountQueryOperator {
        completion = aCompletion
        return self
    }
    
    @discardableResult
    public func getUnreadChatMessageCount(using query: UnreadChatMessageCountQuery) -> Bool {
        defer {
            chatID = nil
            completion = nil
        }
        
        guard chatID != nil else {
            return false
        }
        
        let callback = completion
        let ok = query.getUnreadChatMessageCount(for: chatID!) { result in
            callback?(result)
        }
        
        return ok
    }
}
