//
//  DisplayNameUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol DisplayNameUpdater {

    func updateDisplayName(withNewValue: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol DisplayNameUpdaterOperator {
    
    func withNewValue(_ value: String) -> DisplayNameUpdaterOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> DisplayNameUpdaterOperator
    
    func updateDisplayName(using updater: DisplayNameUpdater) -> Bool
}

public class DisplayNameUpdaterOperation: DisplayNameUpdaterOperator {
    
    var newValue: String?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withNewValue(_ value: String) -> DisplayNameUpdaterOperator {
        newValue = value
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> DisplayNameUpdaterOperator {
        completion = aCompletion
        return self
    }
    
    public func updateDisplayName(using updater: DisplayNameUpdater) -> Bool {
        defer {
            newValue = nil
            completion = nil
        }
        
        guard newValue != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updateDisplayName(withNewValue: newValue!) { result in
            callback?(result)
        }
        return ok
    }
    
}
