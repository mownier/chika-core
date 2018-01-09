//
//  PersonQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PersonQuery {
    
    func getPersons(for personIDs: [ID], completion: @escaping (Result<[Person]>) -> Void) -> Bool
}

public protocol PersonQueryOperator {
    
    func withPersonIDs(_ personIDs: [ID]) -> PersonQueryOperator
    func withCompletion(_ completion: @escaping (Result<[Person]>) -> Void) ->PersonQueryOperator
    
    func getPersons(using query: PersonQuery) -> Bool
}

public class PersonQueryOperation: PersonQueryOperator {
    
    var personIDs: [ID]?
    var completion: ((Result<[Person]>) -> Void)?
    
    public init() {
    }
    
    public func withPersonIDs(_ aPersonIDs: [ID]) -> PersonQueryOperator {
        personIDs = aPersonIDs
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Person]>) -> Void) -> PersonQueryOperator {
        completion = aCompletion
        return self
    }
    
    public func getPersons(using query: PersonQuery) -> Bool {
        defer {
            personIDs?.removeAll()
            personIDs = nil
            completion = nil
        }
        
        guard personIDs != nil else {
            return false
        }
        
        let callback = completion
        let ok = query.getPersons(for: personIDs!) { result in
            callback?(result)
        }
        return ok
    }
}

