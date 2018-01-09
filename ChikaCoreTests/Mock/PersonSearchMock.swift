//
//  PersonSearchMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class PersonSearchMock: PersonSearch {

    func searchPersons(withKeyword keyword: String, completion: @escaping (Result<[Person.SearchObject]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
}
