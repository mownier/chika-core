//
//  AddedContactListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol AddedContactListener {

    func stopListening() -> Bool
    func startListening(withCallback: @escaping (Result<Contact>) -> Void) -> Bool
}

public protocol AddedContactListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<Contact>) -> Void) -> AddedContactListenerOperator
    
    func stopListening(using listener: AddedContactListener) -> Bool
    func startListening(using listener: AddedContactListener) -> Bool
}

public class AddedContactListenerOperation: AddedContactListenerOperator {
    
    var callback: ((Result<Contact>) -> Void)?
    
    public init() {
    }
    
    public func withCallback(_ aCallback: @escaping (Result<Contact>) -> Void) -> AddedContactListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopListening(using listener: AddedContactListener) -> Bool {
        defer {
            callback = nil
        }
        
        return listener.stopListening()
    }
    
    public func startListening(using listener: AddedContactListener) -> Bool {
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
