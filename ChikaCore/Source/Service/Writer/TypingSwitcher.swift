//
//  TypingSwitcher.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol TypingSwitcher {
    
    func switchTypingStatus(to status: TypingStatus, for chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol TypingSwitcherOperator {
    
    func withChatID(_ id: ID) -> TypingSwitcherOperator
    func withNewStatus(_ status: TypingStatus) -> TypingSwitcherOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> TypingSwitcherOperator
    
    func switchTypingStatus(using switcher: TypingSwitcher) -> Bool
}

public class TypingSwitcherOperation: TypingSwitcherOperator {
    
    var chatID: ID?
    var newStatus: TypingStatus?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> TypingSwitcherOperator {
        chatID = id
        return self
    }
    
    public func withNewStatus(_ status: TypingStatus) -> TypingSwitcherOperator {
        newStatus = status
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> TypingSwitcherOperator {
        completion = aCompletion
        return self
    }
    
    public func switchTypingStatus(using switcher: TypingSwitcher) -> Bool {
        defer {
            chatID = nil
            newStatus = nil
            completion = nil
        }
        
        guard chatID != nil, newStatus != nil else {
            return false
        }
        
        let callback = completion
        let ok = switcher.switchTypingStatus(to: newStatus!, for: chatID!) { result in
            callback?(result)
        }
        return ok
    }
}
