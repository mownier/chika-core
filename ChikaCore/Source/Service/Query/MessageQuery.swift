//
//  MessageQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol MessageQuery {
    
    func getMessages(for messageIDs: [ID], completion: @escaping (Result<[Message]>) -> Void) -> Bool
}

public protocol MessageQueryOperator {
    
    func withMessageIDs(_ messageIDs: [ID]) -> MessageQueryOperator
    func withCompletion(_ completion: @escaping (Result<[Message]>) -> Void) ->MessageQueryOperator
    
    func getMessages(using query: MessageQuery) -> Bool
}

public class MessageQueryOperation: MessageQueryOperator {
    
    var messageIDs: [ID]
    var completion: ((Result<[Message]>) -> Void)?
    
    public init() {
        self.messageIDs = []
    }
    
    public func withMessageIDs(_ aMessageIDs: [ID]) -> MessageQueryOperator {
        messageIDs = aMessageIDs
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Message]>) -> Void) -> MessageQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getMessages(using query: MessageQuery) -> Bool {
        let ok = query.getMessages(for: messageIDs) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        messageIDs.removeAll()
        return ok
    }
}

