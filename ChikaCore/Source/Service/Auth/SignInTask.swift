//
//  SignInService.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol SignInTask {

    func signIn(withEmail: String, password: String, completion: @escaping (Result<Auth>) -> Void) -> Bool
}

public protocol SignInOperator {
    
    func signIn(using task: SignInTask) -> Bool
}

public protocol SignInOperationParameter {
    
    func withEmail(_ email: String) -> SignInOperationParameter & SignInOperator
    func withPassword(_ password: String) -> SignInOperationParameter & SignInOperator
    func withCompletion(_ completion: @escaping (Result<Auth>) -> Void) -> SignInOperationParameter & SignInOperator
}

public class SignInOperation: SignInOperator, SignInOperationParameter {
    
    var email: String
    var password: String
    var completion: ((Result<Auth>) -> Void)?
    
    public init() {
        self.email = ""
        self.password = ""
    }
    
    public func signIn(using task: SignInTask) -> Bool {
        return task.signIn(withEmail: email, password: password) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
    }
    
    public func withPassword(_ aPassword: String) -> SignInOperationParameter & SignInOperator {
        password = aPassword
        return self
    }
    
    public func withEmail(_ anEmail: String) -> SignInOperationParameter & SignInOperator {
        email = anEmail
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Auth>) -> Void) -> SignInOperationParameter & SignInOperator {
        completion = aCompletion
        return self
    }
}
