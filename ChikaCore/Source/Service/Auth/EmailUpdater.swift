//
//  EmailUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol EmailUpdater {

    func updateEmail(withNew: String, currentEmail: String, currentPassword: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol EmailUpdaterOperator {
    
    func withNewEmail(_ email: String) -> EmailUpdaterOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> EmailUpdaterOperator
    func withCurrentEmail(_ email: String) -> EmailUpdaterOperator
    func withCurrentPassword(_ password: String) -> EmailUpdaterOperator
    
    func updateEmail(using updater: EmailUpdater) -> Bool
}

public class EmailUpdaterOperation: EmailUpdaterOperator {
    
    var newEmail: String?
    var completion: ((Result<OK>) -> Void)?
    var currentEmail: String?
    var currentPassword: String?
    
    public init() {
    }
    
    public func withNewEmail(_ email: String) -> EmailUpdaterOperator {
        newEmail = email
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> EmailUpdaterOperator {
        completion = aCompletion
        return self
    }
    
    public func withCurrentEmail(_ email: String) -> EmailUpdaterOperator {
        currentEmail = email
        return self
    }
    
    public func withCurrentPassword(_ password: String) -> EmailUpdaterOperator {
        currentPassword = password
        return self
    }
    
    public func updateEmail(using updater: EmailUpdater) -> Bool {
        defer {
            newEmail = nil
            completion = nil
            currentEmail = nil
            currentPassword = nil
        }
        
        guard newEmail != nil, currentEmail != nil, currentPassword != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updateEmail(withNew: newEmail!, currentEmail: currentEmail!, currentPassword: currentPassword!) { result in
            callback?(result)
        }
        return ok
    }
}
