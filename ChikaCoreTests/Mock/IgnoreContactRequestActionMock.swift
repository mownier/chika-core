//
//  IgnoreContactRequestActionMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/9/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class IgnoreContactRequestActionMock: IgnoreContactRequestAction {
    
    func ignoreContactRequest(withID id: ID, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("")))
        return true
    }
    
}
