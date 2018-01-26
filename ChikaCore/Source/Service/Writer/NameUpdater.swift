//
//  NameUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol NameUpdater {
    
    func updateName(withNewValue: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol NameUpdaterOperator {
    
    func withNewValue(_ value: String) -> NameUpdaterOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> NameUpdaterOperator
    
    func updateName(using updater: NameUpdater) -> Bool
}

public class NameUpdaterOperation: NameUpdaterOperator {
    
    var newValue: String?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withNewValue(_ value: String) -> NameUpdaterOperator {
        newValue = value
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> NameUpdaterOperator {
        completion = aCompletion
        return self
    }
    
    public func updateName(using updater: NameUpdater) -> Bool {
        defer {
            newValue = nil
            completion = nil
        }
        
        guard newValue != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updateName(withNewValue: newValue!) { result in
            callback?(result)
        }
        return ok
    }
    
}
