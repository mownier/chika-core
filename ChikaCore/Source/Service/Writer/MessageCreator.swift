//
//  MessageCreator.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol MessageCreator {

    func createMessage(for chatID: ID, participantIDs: [ID], content: String, completion: @escaping (Result<Message>) -> Void) -> Bool
}

public protocol MessageCreatorOperator {
    
    func withChatID(_ id: ID) -> MessageCreatorOperator
    func withContent(_ content: String) -> MessageCreatorOperator
    func withCompletion(_ completion: @escaping (Result<Message>) -> Void) -> MessageCreatorOperator
    func withParticipantIDs(_ ids: [ID]) -> MessageCreatorOperator
    
    func createMessage(using creator: MessageCreator) -> Bool
}

public class MessageCreatorOperation: MessageCreatorOperator {
    
    var chatID: ID?
    var content: String?
    var completion: ((Result<Message>) -> Void)?
    var participantIDs: [ID]?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> MessageCreatorOperator {
        chatID = id
        return self
    }
    
    public func withContent(_ aContent: String) -> MessageCreatorOperator {
        content = aContent
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Message>) -> Void) -> MessageCreatorOperator {
        completion = aCompletion
        return self
    }
    
    public func withParticipantIDs(_ ids: [ID]) -> MessageCreatorOperator {
        participantIDs = ids
        return self
    }
    
    public func createMessage(using creator: MessageCreator) -> Bool {
        guard chatID != nil, content != nil, participantIDs != nil else {
            return false
        }
        
        let callback = completion
        let ok = creator.createMessage(for: chatID!, participantIDs: participantIDs!, content: content!) { result in
            callback?(result)
        }
        chatID = nil
        content = nil
        completion = nil
        participantIDs = nil
        return ok
    }
}
