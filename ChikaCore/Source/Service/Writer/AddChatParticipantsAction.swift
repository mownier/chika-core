//
//  AddChatParticipantsAction.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol AddChatParticipantsAction {

    func addChatParticipants(withPersonIDs: [ID], chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol AddChatParticipantsActionOperator {
    
    func withChatID(_ id: ID) -> AddChatParticipantsActionOperator
    func withPersonIDs(_ ids: [ID]) -> AddChatParticipantsActionOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> AddChatParticipantsActionOperator
    
    func addChatParticipants(using action: AddChatParticipantsAction) -> Bool
}

public class AddChatParticipantsActionOperation: AddChatParticipantsActionOperator {
    
    var chatID: ID?
    var personIDs: [ID]?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> AddChatParticipantsActionOperator {
        chatID = id
        return self
    }
    
    public func withPersonIDs(_ ids: [ID]) -> AddChatParticipantsActionOperator {
        personIDs = Array(Set(ids))
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> AddChatParticipantsActionOperator {
        completion = aCompletion
        return self
    }
    
    public func addChatParticipants(using action: AddChatParticipantsAction) -> Bool {
        defer {
            personIDs?.removeAll()
            chatID = nil
            personIDs = nil
            completion = nil
        }
        
        guard chatID != nil, personIDs != nil else {
            return false
        }
        
        let callback = completion
        let ok = action.addChatParticipants(withPersonIDs: personIDs!, chatID: chatID!) { result in
            callback?(result)
        }
        return ok
    }
}
