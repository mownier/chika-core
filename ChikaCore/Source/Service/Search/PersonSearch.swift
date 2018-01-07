//
//  PersonSearch.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PersonSearch {
    
    func searchPersons(withKeyword keyword: String, completion: @escaping (Result<[Person.SearchObject]>) -> Void) -> Bool
}

public protocol PersonSearchOperator {
    
    func withKeyword(_ keyword: String) -> PersonSearchOperator
    func withCompletion(_ completion: @escaping (Result<[Person.SearchObject]>) -> Void) -> PersonSearchOperator
    
    func searchPersons(using search: PersonSearch) -> Bool
}

public class PersonSearchOperation: PersonSearchOperator {
    
    var keyword: String
    var completion: ((Result<[Person.SearchObject]>) -> Void)?
    
    public init() {
        self.keyword = ""
    }
    
    public func withKeyword(_ aKeyword: String) -> PersonSearchOperator {
        keyword = aKeyword
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<[Person.SearchObject]>) -> Void) -> PersonSearchOperator {
        completion = aCompletion
        return self
    }
    
    public func searchPersons(using search: PersonSearch) -> Bool {
        let ok = search.searchPersons(withKeyword: keyword) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        keyword = ""
        return ok
    }
}

