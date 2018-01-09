//
//  PersonRegistrar.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PersonRegistrar {

    func registerPerson(withID: ID, email: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol PersonRegistrarOperator {
    
    func withEmail(_ email: String) -> PersonRegistrarOperator
    func withPersonID(_ id: ID) -> PersonRegistrarOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> PersonRegistrarOperator
    
    func registerPerson(using registrar: PersonRegistrar) -> Bool
}

public class PersonRegistrarOperation: PersonRegistrarOperator {
    
    var email: String?
    var personID: ID?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withEmail(_ anEmail: String) -> PersonRegistrarOperator {
        email = anEmail
        return self
    }
    
    public func withPersonID(_ id: ID) -> PersonRegistrarOperator {
        personID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> PersonRegistrarOperator {
        completion = aCompletion
        return self
    }
    
    public func registerPerson(using registrar: PersonRegistrar) -> Bool {
        defer {
            email = nil
            personID = nil
            completion = nil
        }
        
        guard email != nil, personID != nil else {
            return false
        }
        
        let callback = completion
        let ok = registrar.registerPerson(withID: personID!, email: email!) { result in
            callback?(result)
        }
        return ok
    }
}
