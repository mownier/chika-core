//
//  AccessTokenRefresher.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol AccessTokenRefresher {

    func refreshAccessToken(withCompletion: @escaping (Result<Auth>) -> Void) -> Bool
}

public protocol AccessTokenRefresherOperator {
    
    func withCompletion(_ completion: @escaping ((Result<Auth>) -> Void)) -> AccessTokenRefresherOperator
    
    func refreshAccessToken(using refresher: AccessTokenRefresher) -> Bool
}

public class AccessTokenRefresherOperation: AccessTokenRefresherOperator {
    
    var completion: ((Result<Auth>) -> Void)?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping ((Result<Auth>) -> Void)) -> AccessTokenRefresherOperator {
        completion = aCompletion
        return self
    }
    
    public func refreshAccessToken(using refresher: AccessTokenRefresher) -> Bool {
        let callback = completion
        let ok = refresher.refreshAccessToken { result in
            callback?(result)
        }
        completion = nil
        return ok
    }
}
