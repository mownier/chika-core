//
//  AddedIntoChatListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/28/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol AddedIntoChatListener {

    func stopListening() -> Bool
    func startListening(withCallback: @escaping (Result<Chat>) -> Void) -> Bool
}

public protocol AddedIntoChatListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<Chat>) -> Void) -> AddedIntoChatListenerOperator
    
    func stopListening(using listener: AddedIntoChatListener) -> Bool
    func startListening(using listener: AddedIntoChatListener) -> Bool
}

public class AddedIntoChatListenerOperation: AddedIntoChatListenerOperator {
    
    var callback: ((Result<Chat>) -> Void)?
    
    public init() {
    }
    
    public func withCallback(_ aCallback: @escaping (Result<Chat>) -> Void) -> AddedIntoChatListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopListening(using listener: AddedIntoChatListener) -> Bool {
        defer {
            callback = nil
        }
        
        return listener.stopListening()
    }
    
    public func startListening(using listener: AddedIntoChatListener) -> Bool {
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
