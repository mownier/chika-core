//
//  MessageSeenInfoQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/10/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class MessageSeenInfoQueryMock: MessageSeenInfoQuery {

    func getMessageSeenInfo(withID id: ID, completion: @escaping (Result<Message.SeenInfo>) -> Void) -> Bool {
        completion(.ok(Message.SeenInfo()))
        return true
    }
    
}
