//
//  PresenceSwitcher.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public enum PresenceStatus {
    
    case offline
    case online
}

public protocol PresenceSwitcher {

    func switchPresenceStatus(_ status: PresenceStatus, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol PresenceSwitcherOperator {
    
    func withStatus(_ status: PresenceStatus) -> PresenceSwitcherOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> PresenceSwitcherOperator
    
    func switchPresenceStatus(using switcher: PresenceSwitcher) -> Bool
}

public class PresenceSwitcherOperation: PresenceSwitcherOperator {
    
    var status: PresenceStatus?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withStatus(_ aStatus: PresenceStatus) -> PresenceSwitcherOperator {
        status = aStatus
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> PresenceSwitcherOperator {
        completion = aCompletion
        return self
    }
    
    public func switchPresenceStatus(using switcher: PresenceSwitcher) -> Bool {
        guard status != nil else {
            return false
        }
        
        let callback = completion
        let ok = switcher.switchPresenceStatus(status!) { result in
            callback?(result)
        }
        status = nil
        completion = nil
        return ok
    }
}
