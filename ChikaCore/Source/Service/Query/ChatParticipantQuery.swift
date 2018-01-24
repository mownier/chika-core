//
//  ChatParticipantQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/24/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatParticipantQuery {

    func getParticipants(of chatID: ID, completion: @escaping (Result<[Person]>) -> Void) -> Bool
}

public protocol ChatParticipantQueryOperator {
    
    func withChatID(_ id: ID) -> ChatParticipantQueryOperator
    func withCompletion(_ completion: @escaping (Result<[Person]>) -> Void) -> ChatParticipantQueryOperator
    
    func getParticipants(using query: ChatParticipantQuery) -> Bool
}

public class ChatParticipantQueryOperation: ChatParticipantQueryOperator {
    
    var chatID: ID?
    var completion: ((Result<[Person]>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> ChatParticipantQueryOperator {
        chatID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Person]>) -> Void) -> ChatParticipantQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getParticipants(using query: ChatParticipantQuery) -> Bool {
        defer {
            chatID = nil
            completion = nil
        }
        
        guard chatID != nil else {
            return false
        }
        
        let callback = completion
        let ok = query.getParticipants(of: chatID!) { result in
            callback?(result)
        }
        return ok
    }
    
    
}
