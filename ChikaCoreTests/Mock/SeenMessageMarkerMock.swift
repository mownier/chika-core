//
//  SeenMessageMarkerMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/11/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class SeenMessageMarkerMock: SeenMessageMarker {

    func markMessageAsSeen(withMessageID id: ID, completion: @escaping (Result<OK>) -> Void) -> Bool {
        completion(.ok(OK("OK")))
        return true
    }
    
}
