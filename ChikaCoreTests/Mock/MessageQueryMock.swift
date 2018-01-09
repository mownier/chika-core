//
//  MessageQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class MessageQueryMock: MessageQuery {

    func getMessages(for messageIDs: [ID], completion: @escaping (Result<[Message]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
}
