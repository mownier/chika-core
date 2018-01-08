//
//  ChatQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ChatQueryMock: ChatQuery {

    func getChats(for chatIDs: [ID], completion: @escaping (Result<[Chat]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
}
