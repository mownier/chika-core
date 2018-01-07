//
//  RefreshTokenTask.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol RefreshTokenTask {

    func refreshToken(withCompletion: @escaping (Result<Auth>) -> Void) -> Bool
}

public protocol RefreshTokenOperator {
    
    func refreshToken(using task: RefreshTokenTask) -> Bool
}

public protocol RefreshTokenOperationParameter {
    
    func withCompletion(_ completion: @escaping ((Result<Auth>) -> Void)) -> RefreshTokenOperator
}

public class RefreshTokenOperation: RefreshTokenOperationParameter, RefreshTokenOperator {
    
    var completion: ((Result<Auth>) -> Void)?
    
    public init() {
    }
    
    public func refreshToken(using task: RefreshTokenTask) -> Bool {
        return task.refreshToken { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
    }
    
    public func withCompletion(_ aCompletion: @escaping ((Result<Auth>) -> Void)) -> RefreshTokenOperator {
        completion = aCompletion
        return self
    }
}
