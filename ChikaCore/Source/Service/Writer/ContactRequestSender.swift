//
//  ContactRequestSender.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ContactRequestSender {

    func sendContactRequest(to personID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol ContactRequestSenderOperator {
    
    func withPersonID(_ id: ID) -> ContactRequestSenderOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> ContactRequestSenderOperator
    
    func sendContactRequest(using sender: ContactRequestSender) -> Bool
}

public class ContactRequestSenderOperation: ContactRequestSenderOperator {
    
    var personID: ID?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
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
        guard personID != nil else {
            return false
        }
        
        let callback = completion
        let ok = sender.sendContactRequest(to: personID!) { result in
            callback?(result)
        }
        personID = nil
        completion = nil
        return ok
    }
}
