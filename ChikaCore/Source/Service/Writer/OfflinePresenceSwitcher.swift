//
//  OfflinePresenceSwitcher.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol OfflinePresenceSwitcher {

    func switchToOffline(withCompletion completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol OfflinePresenceSwitcherOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> OfflinePresenceSwitcherOperator
    
    func switchToOffline(using switcher: OfflinePresenceSwitcher) -> Bool
}

public class OfflinePresenceSwitcherOperation: OfflinePresenceSwitcherOperator {
    
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> OfflinePresenceSwitcherOperator {
        completion = aCompletion
        return self
    }
    
    public func switchToOffline(using switcher: OfflinePresenceSwitcher) -> Bool {
        defer {
            completion = nil
        }
        
        let callback = completion
        let ok = switcher.switchToOffline { result in
            callback?(result)
        }
        return ok
    }
}
