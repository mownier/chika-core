//
//  SignIn.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol SignIn {

    func signIn(withEmail: String, password: String, completion: @escaping (Result<Auth>) -> Void) -> Bool
}

public protocol SignInOperator {
    
    func withEmail(_ email: String) -> SignInOperator
    func withPassword(_ password: String) -> SignInOperator
    func withCompletion(_ completion: @escaping (Result<Auth>) -> Void) -> SignInOperator
    
    func signIn(using task: SignIn) -> Bool
}

public class SignInOperation: SignInOperator {
    
    var email: String?
    var password: String?
    var completion: ((Result<Auth>) -> Void)?
    
    public init() {
    }
    
    public func withEmail(_ anEmail: String) -> SignInOperator {
        email = anEmail
        return self
    }
    
    public func withPassword(_ aPassword: String) -> SignInOperator {
        password = aPassword
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Auth>) -> Void) -> SignInOperator {
        completion = aCompletion
        return self
    }
    
    public func signIn(using task: SignIn) -> Bool {
        defer {
            email = nil
            password = nil
            completion = nil
        }
        
        guard email != nil, password != nil else {
            return false
        }
        
        let callback = completion
        let ok = task.signIn(withEmail: email!, password: password!) { result in
            callback?(result)
        }

        return ok
    }
}
