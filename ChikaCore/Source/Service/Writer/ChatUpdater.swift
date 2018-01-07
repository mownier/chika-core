//
//  ChatUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatUpdater {

    func updateTitle(_ title: String, of chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
    func addParticipants(_ ids: [ID], in chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol ChatUpdaterOperator {
    
    func withTitle(_ title: String) -> ChatUpdaterOperator
    func withChatID(_ id: ID) -> ChatUpdaterOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> ChatUpdaterOperator
    func withParticipantIDs(_ ids: [ID]) -> ChatUpdaterOperator

    func updateTitle(using updater: ChatUpdater) -> Bool
    func addParticipants(using updater: ChatUpdater) -> Bool
}

public class ChatUpdaterOperation: ChatUpdaterOperator {
    
    var title: String?
    var chatID: ID?
    var completion: ((Result<OK>) -> Void)?
    var participantIDs: [ID]?
    
    public init() {
    }
    
    public func withTitle(_ aTitle: String) -> ChatUpdaterOperator {
        title = aTitle
        return self
    }
    
    public func withChatID(_ id: ID) -> ChatUpdaterOperator {
        chatID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> ChatUpdaterOperator {
        completion = aCompletion
        return self
    }
    
    public func withParticipantIDs(_ ids: [ID]) -> ChatUpdaterOperator {
        participantIDs = Array(Set(ids))
        return self
    }
    
    public func updateTitle(using updater: ChatUpdater) -> Bool {
        guard title != nil, chatID != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updateTitle(title!, of: chatID!) { result in
            callback?(result)
        }
        title = nil
        chatID = nil
        completion = nil
        return ok
    }
    
    public func addParticipants(using updater: ChatUpdater) -> Bool {
        guard chatID != nil, participantIDs != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.addParticipants(participantIDs!, in: chatID!) { result in
            callback?(result)
        }
        chatID = nil
        participantIDs = nil
        return ok
    }
}
