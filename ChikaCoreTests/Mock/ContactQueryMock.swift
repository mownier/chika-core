//
//  ContactQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ContactQueryMock: ContactQuery {

    func getContacts(withCompletion completion: @escaping (Result<[Contact]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
}
