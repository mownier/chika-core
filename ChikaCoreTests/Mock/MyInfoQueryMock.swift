//
//  MyInfoQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/15/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class MyInfoQueryMock: MyInfoQuery {

    func getMyInfo(withCompletion completion: @escaping (Result<Person>) -> Void) -> Bool {
        completion(.ok(Person()))
        return true
    }
}
