//
//  SignOut.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol SignOut {

    func signOut(withCompletion completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol SignOutOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> SignOutOperator
    
    func signOut(using task: SignOut) -> Bool
}

public class SignOutOperation: SignOutOperator {
    
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> SignOutOperator {
        completion = aCompletion
        return self
    }
    
    public func signOut(using task: SignOut) -> Bool {
        let callback = completion
        let ok = task.signOut { result in
            callback?(result)
        }
        completion = nil
        return ok
    }
}
