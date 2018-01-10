//
//  RecentChatListener.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol RecentChatListener {

    func stopListening() -> Bool
    func startListening(withCallback callback: @escaping (Result<Chat>) -> Void) -> Bool
}

public protocol RecentChatListenerOperator {
    
    func withCallback(_ callback: @escaping (Result<Chat>) -> Void) -> RecentChatListenerOperator
    
    func stopListening(using listener: RecentChatListener) -> Bool
    func startListening(using listener: RecentChatListener) -> Bool
}

public class RecentChatListenerOperation: RecentChatListenerOperator {
    
    var callback: ((Result<Chat>) -> Void)?
    
    public init(){
    }
    
    public func withCallback(_ aCallback: @escaping (Result<Chat>) -> Void) -> RecentChatListenerOperator {
        callback = aCallback
        return self
    }
    
    public func stopListening(using listener: RecentChatListener) -> Bool {
        defer {
            callback = nil
        }
        
        return listener.stopListening()
    }
    
    public func startListening(using listener: RecentChatListener) -> Bool {
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
