//
//  MessageCreatorMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class MessageCreatorMock: MessageCreator {
    
    func createMessage(for chatID: ID, content: String, completion: @escaping (Result<Message>) -> Void) -> Bool {
        completion(.ok(Message()))
        return true
    }
    
}
