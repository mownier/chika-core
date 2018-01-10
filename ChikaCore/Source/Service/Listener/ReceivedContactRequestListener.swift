//
//  ReceivedContactRequestListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ReceivedContactRequestListener {

    func stopListening() -> Bool
    func startListening(withCallback callback: @escaping (Result<Contact.Request>) -> Void) -> Bool
}

public protocol ReceivedContactRequestListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<Contact.Request>) -> Void) -> ReceivedContactRequestListenerOperator
    
    func stopListening(using listener: ReceivedContactRequestListener) -> Bool
    func startListening(using listener: ReceivedContactRequestListener) -> Bool
}

public class ReceivedContactRequestListenerOperation: ReceivedContactRequestListenerOperator {
    
    var callback: ((Result<Contact.Request>) -> Void)?
    
    public init() {
    }
    
    public func withCallback(_ aCallback: @escaping (Result<Contact.Request>) -> Void) -> ReceivedContactRequestListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopListening(using listener: ReceivedContactRequestListener) -> Bool {
        defer {
            callback = nil
        }
        
        return listener.stopListening()
    }
    
    public func startListening(using listener: ReceivedContactRequestListener) -> Bool {
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
