//
//  IgnoreContactRequestAction.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol IgnoreContactRequestAction {
    
    func ignoreContactRequest(withID id: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol IgnoreContactRequestActionOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void)  -> IgnoreContactRequestActionOperator
    func withContactRequestID(_ id: ID) -> IgnoreContactRequestActionOperator
    
    func ignoreContactRequest(using action: IgnoreContactRequestAction) -> Bool
}

public class IgnoreContactRequestActionOperation: IgnoreContactRequestActionOperator {
    
    var completion: ((Result<OK>) -> Void)?
    var contactRequestID: ID?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> IgnoreContactRequestActionOperator {
        completion = aCompletion
        return self
    }
    
    public func withContactRequestID(_ id: ID) -> IgnoreContactRequestActionOperator {
        contactRequestID = id
        return self
    }
    
    public func ignoreContactRequest(using action: IgnoreContactRequestAction) -> Bool {
        defer {
            completion = nil
            contactRequestID = nil
        }
        
        guard contactRequestID != nil else {
            return false
        }
        
        let callback = completion
        let ok = action.ignoreContactRequest(withID: contactRequestID!) { result in
            callback?(result)
        }
        return ok
    }
}

