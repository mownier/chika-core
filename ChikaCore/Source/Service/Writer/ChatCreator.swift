//
//  ChatCreator.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatCreator {

    func createChat(withTitle title: String, message: String, participantIDs: [ID], completion: @escaping (Result<Chat>) -> Void) -> Bool
}

public protocol ChatCreatorOperator {
    
    func withTitle(_ title: String) -> ChatCreatorOperator
    func withMessage(_ message: String) -> ChatCreatorOperator
    func withCompletion(_ completion: @escaping (Result<Chat>) -> Void) -> ChatCreatorOperator
    func withParticipantIDs(_ ids: [ID]) -> ChatCreatorOperator
    
    func createChat(using creator: ChatCreator) -> Bool
}

public class ChatCreatorOperation: ChatCreatorOperator {
    
    var title: String?
    var message: String?
    var completion: ((Result<Chat>) -> Void)?
    var participantIDs: [ID]?
    
    public init() {
    }
    
    public func withTitle(_ aTitle: String) -> ChatCreatorOperator {
        title = aTitle
        return self
    }
    
    public func withMessage(_ aMessage: String) -> ChatCreatorOperator {
        message = aMessage
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Chat>) -> Void) -> ChatCreatorOperator {
        completion = aCompletion
        return self
    }
    
    public func withParticipantIDs(_ ids: [ID]) -> ChatCreatorOperator {
        participantIDs = ids
        return self
    }
    
    public func createChat(using creator: ChatCreator) -> Bool {
        guard title != nil, message != nil, participantIDs != nil else {
            return false
        }
        
        let callback = completion
        let ok = creator.createChat(withTitle: title!, message: message!, participantIDs: participantIDs!) { result in
            callback?(result)
        }
        title = nil
        message = nil
        completion = nil
        participantIDs = nil
        return ok
    }
    
}
