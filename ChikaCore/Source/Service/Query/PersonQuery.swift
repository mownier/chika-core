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
    
    var personIDs: [ID]
    var completion: ((Result<[Person]>) -> Void)?
    
    public init() {
        self.personIDs = []
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
        let ok = query.getPersons(for: personIDs) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        personIDs.removeAll()
        return ok
    }
}

