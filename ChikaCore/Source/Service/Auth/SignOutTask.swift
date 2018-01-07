//
//  SignOutTask.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol SignOutTask {

    func signOut(withCompletion completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol SignOutOperator {
    
    func signOut(using task: SignOutTask) -> Bool
}

public protocol SignOutOperationParameter {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> SignOutOperator
}

public class SignOutOperation: SignOutOperationParameter, SignOutOperator {
    
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func signOut(using task: SignOutTask) -> Bool {
        return task.signOut { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> SignOutOperator {
        completion = aCompletion
        return self
    }
}
