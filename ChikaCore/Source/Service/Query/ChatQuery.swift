//
//  ChatQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatQuery {

    func getChats(for chatIDs: [ID], completion: @escaping (Result<[Chat]>) -> Void) -> Bool
}

public protocol ChatQueryOperator {
    
    func withChatIDs(_ chatIDs: [ID]) -> ChatQueryOperator
    func withCompletion(_ completion: @escaping (Result<[Chat]>) -> Void) ->ChatQueryOperator
    
    func getChats(using query: ChatQuery) -> Bool
}

public class ChatQueryOperation: ChatQueryOperator {
    
    var chatIDs: [ID]?
    var completion: ((Result<[Chat]>) -> Void)?
    
    public init() {
    }
    
    public func withChatIDs(_ aChatIDs: [ID]) -> ChatQueryOperator {
        chatIDs = aChatIDs
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Chat]>) -> Void) -> ChatQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getChats(using query: ChatQuery) -> Bool {
        defer {
            chatIDs?.removeAll()
            chatIDs = nil
            completion = nil
        }
        
        guard chatIDs != nil else {
            return false
        }
        
        let callback = completion
        let ok = query.getChats(for: chatIDs!) { result in
            callback?(result)
        }
        return ok
    }
}
