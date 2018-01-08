//
//  Registrar.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol Registrar {
    
    func register(withEmail: String, password: String, completion: @escaping (Result<Auth>) -> Void) -> Bool
}

public protocol RegistrarOperator {
    
    func withEmail(_ email: String) -> RegistrarOperator
    func withPassword(_ password: String) -> RegistrarOperator
    func withCompletion(_ completion: @escaping (Result<Auth>) -> Void) -> RegistrarOperator
    
    func register(using registrar: Registrar) -> Bool
}

public class RegistrarOperation: RegistrarOperator {
    
    var email: String?
    var password: String?
    var completion: ((Result<Auth>) -> Void)?
    
    public init() {
    }
    
    public func withPassword(_ aPassword: String) -> RegistrarOperator {
        password = aPassword
        return self
    }
    
    public func withEmail(_ anEmail: String) -> RegistrarOperator {
        email = anEmail
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Auth>) -> Void) -> RegistrarOperator {
        completion = aCompletion
        return self
    }
    
    public func register(using registrar: Registrar) -> Bool {
        defer {
            email = nil
            password = nil
            completion = nil
        }
        
        guard email != nil, password != nil else {
            return false
        }
        
        let callback = completion
        let ok = registrar.register(withEmail: email!, password: password!) { result in
            callback?(result)
        }
        return ok
    }
}
