//
//  PasswordUpdater.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol PasswordUpdater {

    func updatePassword(withNew: String, currentPassword: String, currentEmail: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol PasswordUpdaterOperator {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> PasswordUpdaterOperator
    func withNewPassword(_ password: String) -> PasswordUpdaterOperator
    func withCurrentEmail(_ email: String) -> PasswordUpdaterOperator
    func withCurrentPassword(_ password: String) -> PasswordUpdaterOperator
    
    func updatePassword(using updater: PasswordUpdater) -> Bool
}

public class PasswordUpdaterOperation: PasswordUpdaterOperator {
    
    var completion: ((Result<OK>) -> Void)?
    var newPassword: String?
    var currentEmail: String?
    var currentPassword: String?
    
    public init() {
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> PasswordUpdaterOperator {
        completion = aCompletion
        return self
    }
    
    public func withNewPassword(_ password: String) -> PasswordUpdaterOperator {
        newPassword = password
        return self
    }
    
    public func withCurrentEmail(_ email: String) -> PasswordUpdaterOperator {
        currentEmail = email
        return self
    }
    
    public func withCurrentPassword(_ password: String) -> PasswordUpdaterOperator {
        currentPassword = password
        return self
    }
    
    public func updatePassword(using updater: PasswordUpdater) -> Bool {
        guard newPassword != nil, currentEmail != nil, currentPassword != nil else {
            return false
        }
        
        let callback = completion
        let ok = updater.updatePassword(withNew: newPassword!, currentPassword: currentPassword!, currentEmail: currentEmail!) { result in
            callback?(result)
        }
        completion = nil
        newPassword = nil
        currentEmail = nil
        currentPassword = nil
        return ok
    }
}
