//
//  ContactRequestQueryMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 1/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ContactRequestQueryMock: ContactRequestQuery {

    func getContactRequests(withCompletion completion: @escaping (Result<[Contact.Request]>) -> Void) -> Bool {
        completion(.ok([]))
        return true
    }
    
}
