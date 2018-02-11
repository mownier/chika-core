//
//  SeenMessageMarker.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/11/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol SeenMessageMarker {

    func markMessageAsSeen(withMessageID id: ID, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol SeenMessageMarkerOperator {
    
    func withMessageID(_ id: ID) -> SeenMessageMarkerOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> SeenMessageMarkerOperator
    
    func markMessageAsSeen(using marker: SeenMessageMarker) -> Bool
}

public class SeenMessageMarkerOperation: SeenMessageMarkerOperator {
    
    var messageID: ID?
    var completion: ((Result<OK>) -> Void)?
    
    public init() {
    }
    
    public func withMessageID(_ id: ID) -> SeenMessageMarkerOperator {
        messageID = id
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> SeenMessageMarkerOperator {
        completion = aCompletion
        return self
    }
    
    public func markMessageAsSeen(using marker: SeenMessageMarker) -> Bool {
        defer {
            messageID = nil
            completion = nil
        }
        
        guard messageID != nil else {
            return false
        }
        
        let callback = completion
        let ok = marker.markMessageAsSeen(withMessageID: messageID!) { result in
            callback?(result)
        }
        return ok
    }
    
}
