//
//  ChatTitleUpdaterMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ChatTitleUpdaterMock: ChatTitleUpdater {

    func updateTitle(_ title: String, of chatID: ID, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
}
