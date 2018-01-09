//
//  ChatCreatorMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ChatCreatorMock: ChatCreator {

    func createChat(withTitle title: String, message: String, participantIDs: [ID], completion: @escaping (Result<Chat>) -> Void) -> Bool {
        completion(.ok(Chat()))
        return true
    }
}
