//
//  PersonRegistrar.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PersonRegistrar {

    func registerPerson(withCompletion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol PersonRegistrarOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> PersonRegistrarOperator
    
    func registerPerson(using registrar: PersonRegistrar) -> Bool
}

public class PersonRegistrarOperation: PersonRegistrarOperator {
    
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> PersonRegistrarOperator {
        completion = aCompletion
        return self
    }
    
    public func registerPerson(using registrar: PersonRegistrar) -> Bool {
        defer {
            completion = nil
        }
        
        let callback = completion
        let ok = registrar.registerPerson { result in
            callback?(result)
        }
        return ok
    }
}
