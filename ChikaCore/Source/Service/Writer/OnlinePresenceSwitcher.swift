//
//  OnlinePresenceSwitcher.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol OnlinePresenceSwitcher {
    
    func switchToOnline(withCompletion completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol OnlinePresenceSwitcherOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> OnlinePresenceSwitcherOperator
    
    func switchToOnline(using switcher: OnlinePresenceSwitcher) -> Bool
}

public class OnlinePresenceSwitcherOperation: OnlinePresenceSwitcherOperator {
    
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> OnlinePresenceSwitcherOperator {
        completion = aCompletion
        return self
    }
    
    public func switchToOnline(using switcher: OnlinePresenceSwitcher) -> Bool {
        defer {
            completion = nil
        }
        
        let callback = completion
        let ok = switcher.switchToOnline { result in
            callback?(result)
        }
        return ok
    }
}

