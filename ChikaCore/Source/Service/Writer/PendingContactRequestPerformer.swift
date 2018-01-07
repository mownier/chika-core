//
//  PendingContactRequestPerformer.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public enum PendingContactRequestAction {
    
    case accept
    case ignore
}

public protocol PendingContactRequestPerformer {

    func performAction(_ action: PendingContactRequestAction, contactRequestID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol PendingContactRequestPerformerOperator {
    
    func withAction(_ action: PendingContactRequestAction) -> PendingContactRequestPerformerOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> PendingContactRequestPerformerOperator
    func withContactRequestID(_ id: ID) -> PendingContactRequestPerformerOperator
    
    func performAction(using performer: PendingContactRequestPerformer) -> Bool
}

public class PendingContactRequestPerformerOperation: PendingContactRequestPerformerOperator {
    
    var action: PendingContactRequestAction?
    var completion: ((Result<OK>) -> Void)?
    var contactRequestID: ID?
    
    public init() {
    }
    
    public func withAction(_ anAction: PendingContactRequestAction) -> PendingContactRequestPerformerOperator {
        action = anAction
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> PendingContactRequestPerformerOperator {
        completion = aCompletion
        return self
    }
    
    public func withContactRequestID(_ id: ID) -> PendingContactRequestPerformerOperator {
        contactRequestID = id
        return self
    }
    
    public func performAction(using performer: PendingContactRequestPerformer) -> Bool {
        guard action != nil, contactRequestID != nil else {
            return false
        }
        
        let callback = completion
        let ok = performer.performAction(action!, contactRequestID: contactRequestID!) { result in
            callback?(result)
        }
        action = nil
        completion = nil
        contactRequestID = nil
        return ok
    }
}
