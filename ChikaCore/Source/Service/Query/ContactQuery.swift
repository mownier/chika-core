//
//  ContactQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ContactQuery {
    
    func getContacts(withCompletion: @escaping (Result<[Contact]>) -> Void) -> Bool
}

public protocol ContactQueryOperator {
    
    func withCompletion(_ completion: @escaping (Result<[Contact]>) -> Void) -> ContactQueryOperator
    
    func getContacts(using query: ContactQuery) -> Bool
}

public class ContactQueryOperation: ContactQueryOperator {
    
    var completion: ((Result<[Contact]>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Contact]>) -> Void) -> ContactQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getContacts(using query: ContactQuery) -> Bool {
        return query.getContacts { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
    }
}


