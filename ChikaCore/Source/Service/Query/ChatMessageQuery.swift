//
//  ChatMessageQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatMessageQuery {

    func getMessages(of chatID: ID, completion: @escaping (Result<[Message]>) -> Void) -> Bool
}

public protocol ChatMessageQueryOperator {
    
    func withChatID(_ id: ID) -> ChatMessageQueryOperator
    func withCompletion(_ completion: @escaping (Result<[Message]>) -> Void) -> ChatMessageQueryOperator
    
    func getMessages(using query: ChatMessageQuery) -> Bool
}

public class ChatMessageQueryOperation: ChatMessageQueryOperator {
    
    var chatID: ID?
    var completion: ((Result<[Message]>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> ChatMessageQueryOperator {
        chatID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Message]>) -> Void) -> ChatMessageQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getMessages(using query: ChatMessageQuery) -> Bool {
        defer {
            chatID = nil
        }
        
        guard chatID != nil else {
            return false
        }
        
        let callback = completion
        let ok = query.getMessages(of: chatID!) { result in
            callback?(result)
        }
        return ok
    }
}
