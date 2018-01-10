//
//  ContactRequestActionListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ContactRequestActionListener {

    func stopListening() -> Bool
    func startListening(withCallback callback: @escaping (Result<ID>) -> Void) -> Bool
}

public protocol AcceptedContactRequestListener: ContactRequestActionListener { }

public protocol IgnoredContactRequestListener: ContactRequestActionListener { }

public protocol ContactRequestActionListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<ID>) -> Void) -> ContactRequestActionListenerOperator
    
    func stopListening(using listener: ContactRequestActionListener) -> Bool
    func startListening(using listener: ContactRequestActionListener) -> Bool
}

public class ContactRequestActionListenerOperation: ContactRequestActionListenerOperator {
    
    var callback: ((Result<ID>) -> Void)?
    
    public init() {
    }
    
    public func withCallback(_ aCallback: @escaping (Result<ID>) -> Void) -> ContactRequestActionListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopListening(using listener: ContactRequestActionListener) -> Bool {
        defer {
            callback = nil
        }
        
        return listener.stopListening()
    }
    
    public func startListening(using listener: ContactRequestActionListener) -> Bool {
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
