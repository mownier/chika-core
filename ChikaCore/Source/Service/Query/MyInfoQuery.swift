//
//  MyInfoQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/15/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol MyInfoQuery {
    
    func getMyInfo(withCompletion: @escaping (Result<Person>) -> Void) -> Bool
}

public protocol MyInfoQueryOperator {
    
    func withCompletion(_ completion: @escaping (Result<Person>) -> Void) -> MyInfoQueryOperator
    
    func getMyInfo(using query: MyInfoQuery) -> Bool
}

public class MyInfoQueryOperation: MyInfoQueryOperator {
    
    var completion: ((Result<Person>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Person>) -> Void) -> MyInfoQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getMyInfo(using query: MyInfoQuery) -> Bool {
        defer {
            completion = nil
        }
        
        let callback = completion
        let ok = query.getMyInfo { result in
            callback?(result)
        }
        return ok
    }
}
