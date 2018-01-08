//
//  EmailUpdaterMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class EmailUpdaterMock: EmailUpdater {
    
    func updateEmail(withNew newEmail: String, currentEmail: String, currentPassword: String, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
}
