//
//  AccepContactRequestAction.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol AccepContactRequestAction {

    func acceptContactRequest(withID id: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol AccepContactRequestActionOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void)  -> AccepContactRequestActionOperator
    func withContactRequestID(_ id: ID) -> AccepContactRequestActionOperator
    
    func acceptContactRequest(using action: AccepContactRequestAction) -> Bool
}

public class AccepContactRequestActionOperation: AccepContactRequestActionOperator {
    
    var completion: ((Result<OK>) -> Void)?
    var contactRequestID: ID?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> AccepContactRequestActionOperator {
        completion = aCompletion
        return self
    }
    
    public func withContactRequestID(_ id: ID) -> AccepContactRequestActionOperator {
        contactRequestID = id
        return self
    }
    
    public func acceptContactRequest(using action: AccepContactRequestAction) -> Bool {
        defer {
            completion = nil
            contactRequestID = nil
        }
        
        guard contactRequestID != nil else {
            return false
        }
        
        let callback = completion
        let ok = action.acceptContactRequest(withID: contactRequestID!) { result in
            callback?(result)
        }
        return ok
    }
}
