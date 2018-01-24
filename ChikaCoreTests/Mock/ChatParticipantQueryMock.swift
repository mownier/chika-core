//
//  ChatParticipantQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/24/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ChatParticipantQueryMock: ChatParticipantQuery {

    func getParticipants(of chatID: ID, completion: @escaping (Result<[Person]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
}
