//
//  PersonUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PersonUpdater {

    func updatePerson(withNewValue person: Person, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol PersonUpdaterOperator {
    
    func withNewValue(_ person: Person) -> PersonUpdaterOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> PersonUpdaterOperator
    
    func updatPerson(using updater: PersonUpdater) -> Bool
}

public class PersonUpdaterOperation: PersonUpdaterOperator {
    
    var newValue: Person?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withNewValue(_ person: Person) -> PersonUpdaterOperator {
        newValue = person
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> PersonUpdaterOperator{
        completion = aCompletion
        return self
    }
    
    public func updatPerson(using updater: PersonUpdater) -> Bool {
        guard newValue != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updatePerson(withNewValue: newValue!) { result in
            callback?(result)
        }
        newValue = nil
        completion = nil
        return ok
    }
}
