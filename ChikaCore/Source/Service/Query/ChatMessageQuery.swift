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
    
    var chatID: ID
    var completion: ((Result<[Message]>) -> Void)?
    
    public init() {
        self.chatID = ID("")
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
        let ok = query.getMessages(of: chatID) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        chatID = ID("")
        return ok
    }
}
