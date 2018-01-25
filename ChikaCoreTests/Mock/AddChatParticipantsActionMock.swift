//
//  AddChatParticipantsActionMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class AddChatParticipantsActionMock: AddChatParticipantsAction {

    func addChatParticipants(withPersonIDs: [ID], chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
}
