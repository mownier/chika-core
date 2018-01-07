//
//  RegisterTask.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol RegisterTask {
    
    func register(withEmail: String, password: String, completion: @escaping (Result<Auth>) -> Void) -> Bool
}

public protocol RegisterOperator {
    
    func register(using task: RegisterTask) -> Bool
}

public protocol RegisterOperationParameter {
    
    func withEmail(_ email: String) -> RegisterOperationParameter & RegisterOperator
    func withPassword(_ password: String) ->RegisterOperationParameter & RegisterOperator
    func withCompletion(_ completion: @escaping (Result<Auth>) -> Void) -> RegisterOperationParameter & RegisterOperator
}

public class RegisterOperation: RegisterOperator, RegisterOperationParameter {
    
    var email: String
    var password: String
    var completion: ((Result<Auth>) -> Void)?
    
    public init() {
        self.email = ""
        self.password = ""
    }
    
    public func register(using task: RegisterTask) -> Bool {
        return task.register(withEmail: email, password: password) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
    }
    
    public func withPassword(_ aPassword: String) -> RegisterOperationParameter & RegisterOperator {
        password = aPassword
        return self
    }
    
    public func withEmail(_ anEmail: String) -> RegisterOperationParameter & RegisterOperator {
        email = anEmail
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Auth>) -> Void) -> RegisterOperationParameter & RegisterOperator {
        completion = aCompletion
        return self
    }
}
