//
//  PersonRegistrarMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class PersonRegistrarMock: PersonRegistrar {

    func registerPerson(withID: ID, email: String, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
}
