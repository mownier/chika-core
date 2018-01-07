//
//  TypingSwitcher.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public enum TypingStatus {
    
    case typing
    case notTyping
}

public protocol TypingSwitcher {
    
    func switchTypingStatus(_ status: TypingStatus, for chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol TypingSwitcherOperator {
    
    func withChatID(_ id: ID) -> TypingSwitcherOperator
    func withStatus(_ status: TypingStatus) -> TypingSwitcherOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> TypingSwitcherOperator
    
    func switchTypingStatus(using switcher: TypingSwitcher) -> Bool
}

public class TypingSwitcherOperation: TypingSwitcherOperator {
    
    var chatID: ID?
    var status: TypingStatus?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withChatID(_ id: ID) -> TypingSwitcherOperator {
        chatID = id
        return self
    }
    
    public func withStatus(_ aStatus: TypingStatus) -> TypingSwitcherOperator {
        status = aStatus
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> TypingSwitcherOperator {
        completion = aCompletion
        return self
    }
    
    public func switchTypingStatus(using switcher: TypingSwitcher) -> Bool {
        guard chatID != nil, status != nil else {
            return false
        }
        
        let callback = completion
        let ok = switcher.switchTypingStatus(status!, for: chatID!) { result in
            callback?(result)
        }
        chatID = nil
        status = nil
        completion = nil
        return ok
    }
}
