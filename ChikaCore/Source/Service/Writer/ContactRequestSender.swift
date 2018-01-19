//
//  ContactRequestSender.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ContactRequestSender {

    func sendContactRequest(to personID: ID, message: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol ContactRequestSenderOperator {
    
    func withMessage( _ message: String) -> ContactRequestSenderOperator
    func withPersonID(_ id: ID) -> ContactRequestSenderOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> ContactRequestSenderOperator
    
    func sendContactRequest(using sender: ContactRequestSender) -> Bool
}

public class ContactRequestSenderOperation: ContactRequestSenderOperator {
    
    var message: String?
    var personID: ID?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withMessage(_ aMessage: String) -> ContactRequestSenderOperator {
        message = aMessage
        return self
    }
    
    public func withPersonID(_ id: ID) -> ContactRequestSenderOperator {
        personID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> ContactRequestSenderOperator {
        completion = aCompletion
        return self
    }
    
    public func sendContactRequest(using sender: ContactRequestSender) -> Bool {
        defer {
            message = nil
            personID = nil
            completion = nil
        }
        
        guard personID != nil, message != nil else {
            return false
        }
        
        let callback = completion
        let ok = sender.sendContactRequest(to: personID!, message: message!) { result in
            callback?(result)
        }
        return ok
    }
}
