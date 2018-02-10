//
//  UnreadChatMessageCountQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class UnreadChatMessageCountQueryMock: UnreadChatMessageCountQuery {

    func getUnreadChatMessageCount(for chatID: ID, completion: @escaping (Result<UInt>) -> Void) -> Bool {
        completion(.ok(0))
        return true
    }
    
}
