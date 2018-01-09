//
//  ChatTitleUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChatTitleUpdater {
    
    func updateTitle(_ title: String, of chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol ChatTitleUpdaterOperator {
    
    func withTitle(_ title: String) -> ChatTitleUpdaterOperator
    func withChatID(_ id: ID) -> ChatTitleUpdaterOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> ChatTitleUpdaterOperator
    
    func updateTitle(using updater: ChatTitleUpdater) -> Bool
}

public class ChatTitleUpdaterOperation: ChatTitleUpdaterOperator {
    
    var title: String?
    var chatID: ID?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withTitle(_ aTitle: String) -> ChatTitleUpdaterOperator {
        title = aTitle
        return self
    }
    
    public func withChatID(_ id: ID) -> ChatTitleUpdaterOperator {
        chatID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> ChatTitleUpdaterOperator {
        completion = aCompletion
        return self
    }
    
    public func updateTitle(using updater: ChatTitleUpdater) -> Bool {
        defer {
            title = nil
            chatID = nil
            completion = nil
        }
        
        guard title != nil, chatID != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updateTitle(title!, of: chatID!) { result in
            callback?(result)
        }
        return ok
    }
}

