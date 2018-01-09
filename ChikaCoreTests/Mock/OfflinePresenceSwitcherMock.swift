//
//  OfflinePresenceSwitcherMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class OfflinePresenceSwitcherMock: OfflinePresenceSwitcher {

    func switchToOffline(withCompletion completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
}
