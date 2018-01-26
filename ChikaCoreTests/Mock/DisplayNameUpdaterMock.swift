//
//  DisplayNameUpdaterMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class DisplayNameUpdaterMock: DisplayNameUpdater {
    
    func updateDisplayName(withNewValue: String, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
    
}
