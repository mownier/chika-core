//
//  AcceptContactRequestAction.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol AcceptContactRequestAction {

    func acceptContactRequest(withID id: ID, requestorID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol AcceptContactRequestActionOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void)  -> AcceptContactRequestActionOperator
    func withRequestorID(_ id: ID) -> AcceptContactRequestActionOperator
    func withContactRequestID(_ id: ID) -> AcceptContactRequestActionOperator
    
    func acceptContactRequest(using action: AcceptContactRequestAction) -> Bool
}

public class AcceptContactRequestActionOperation: AcceptContactRequestActionOperator {
    
    var completion: ((Result<OK>) -> Void)?
    var requestorID: ID?
    var contactRequestID: ID?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> AcceptContactRequestActionOperator {
        completion = aCompletion
        return self
    }
    
    public func withRequestorID(_ id: ID) -> AcceptContactRequestActionOperator {
        requestorID = id
        return self
    }
    
    public func withContactRequestID(_ id: ID) -> AcceptContactRequestActionOperator {
        contactRequestID = id
        return self
    }
    
    public func acceptContactRequest(using action: AcceptContactRequestAction) -> Bool {
        defer {
            completion = nil
            requestorID = nil
            contactRequestID = nil
        }
        
        guard contactRequestID != nil, requestorID != nil else {
            return false
        }
        
        let callback = completion
        let ok = action.acceptContactRequest(withID: contactRequestID!, requestorID: requestorID!) { result in
            callback?(result)
        }
        return ok
    }
}
