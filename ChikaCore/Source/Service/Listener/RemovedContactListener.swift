//
//  RemovedContactListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol RemovedContactListener {

    func startListening(withCallback: @escaping (Result<ID>) -> Void) -> Bool
    func stopListening() -> Bool
}

public protocol RemovedContactListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<ID>) -> Void) -> RemovedContactListenerOperator
    
    func stopListening(using listener: RemovedContactListener) -> Bool
    func startListening(using listener: RemovedContactListener) -> Bool
}

public class RemovedContactListenerOperation: RemovedContactListenerOperator {
    
    var callback: ((Result<ID>) -> Void)?
    
    public init() {
    }
    
    public func withCallback(_ aCallback: @escaping (Result<ID>) -> Void) -> RemovedContactListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopListening(using listener: RemovedContactListener) -> Bool {
        defer {
            callback = nil
        }
        
        return listener.stopListening()
    }
    
    public func startListening(using listener: RemovedContactListener) -> Bool {
        defer {
            callback = nil
        }
        
        let block = callback
        let ok = listener.startListening { result in
            block?(result)
        }
        return ok
    }
}
