//
//  ContactRequestQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ContactRequestQuery {

    func getContactRequests(withCompletion: @escaping (Result<[Contact.Request]>) -> Void) -> Bool
}

public protocol ContactRequestQueryOperator {
    
    func withCompletion(_ completion: @escaping (Result<[Contact.Request]>) -> Void) -> ContactRequestQueryOperator
    
    func getContactRequests(using query: ContactRequestQuery) -> Bool
}

public class ContactRequestQueryOperation: ContactRequestQueryOperator {
    
    var completion: ((Result<[Contact.Request]>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Contact.Request]>) -> Void) -> ContactRequestQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getContactRequests(using query: ContactRequestQuery) -> Bool {
        defer {
            completion = nil
        }
        
        let callback = completion
        let ok = query.getContactRequests { result in
            callback?(result)
        }
        return ok
    }
    
}
