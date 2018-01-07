//
//  RecentMessageQuery.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol RecentChatMessageQuery {
    
    func getRecentChatMessage(of chatID: ID, completion: @escaping (Result<Message>) -> Void) -> Bool
}

public protocol RecentChatMessageOperator {
    
    func withChatID(_ id: ID) -> RecentChatMessageOperator
    func withCompletion(_ completion: @escaping (Result<Message>) -> Void) -> RecentChatMessageOperator
    
    func getRecentChatMessage(using query: RecentChatMessageQuery) -> Bool
}

public class RecentChatMessageOperation: RecentChatMessageOperator {
    
    var chatID: ID
    var completion: ((Result<Message>) -> Void)?
    
    public init() {
        self.chatID = ID("")
    }
    
    public func withChatID(_ id: ID) -> RecentChatMessageOperator {
        chatID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<Message>) -> Void) -> RecentChatMessageOperator {
        completion = aCompletion
        return self
    }
    
    public func getRecentChatMessage(using query: RecentChatMessageQuery) -> Bool {
        let ok = query.getRecentChatMessage(of: chatID) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        chatID = ID("")
        return ok
    }
}
