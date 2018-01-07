//
//  InboxQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol InboxQuery {
    
    func getInbox(withCompletion completion: @escaping (Result<[Chat]>) -> Void) -> Bool
}

public protocol InboxQueryOperator {
    
    func withCompletion(_ completion: @escaping (Result<[Chat]>) -> Void) -> InboxQueryOperator
    
    func getInbox(using query: InboxQuery) -> Bool
}

public class InboxQueryOperation: InboxQueryOperator {
    
    var completion: ((Result<[Chat]>) -> Void)?
    
    public init() {
    }
    
    public func getInbox(using query: InboxQuery) -> Bool {
        return query.getInbox { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Chat]>) -> Void) -> InboxQueryOperator {
        completion = aCompletion
        return self
    }
}
