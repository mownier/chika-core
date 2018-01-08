//
//  AccessTokenRefresherMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/8/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class AccessTokenRefresherMock: AccessTokenRefresher {

    func refreshAccessToken(withCompletion completion: @escaping (Result<Auth>) -> Void) -> Bool {
        completion(.ok(Auth()))
        return true
    }
}
