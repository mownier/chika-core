//
//  TypingSwitcherMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class TypingSwitcherMock: TypingSwitcher {

    func switchTypingStatus(to status: TypingStatus, for chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
}
