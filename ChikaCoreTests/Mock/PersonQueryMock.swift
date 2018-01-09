//
//  PersonQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class PersonQueryMock: PersonQuery {

    func getPersons(for personIDs: [ID], completion: @escaping (Result<[Person]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
}
