//
//  ChangePasswordTask.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChangePasswordTask {

    func changePassword(withNew: String, currentPassword: String, currentEmail: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol ChangePasswordOperator {
    
    func changePassword(using task: ChangePasswordTask) -> Bool
}

public protocol ChangePasswordOperationParameter {
    
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> ChangePasswordOperationParameter & ChangePasswordOperator
    func withNewPassword(_ password: String) -> ChangePasswordOperationParameter & ChangePasswordOperator
    func withCurrentEmail(_ email: String) -> ChangePasswordOperationParameter & ChangePasswordOperator
    func withCurrentPassword(_ password: String) -> ChangePasswordOperationParameter & ChangePasswordOperator
}

public class ChangePasswordOperation: ChangePasswordOperationParameter, ChangePasswordOperator {
    
    var completion: ((Result<OK>) -> Void)?
    var newPassword: String
    var currentEmail: String
    var currentPassword: String
    
    public init() {
        self.newPassword = ""
        self.currentEmail = ""
        self.currentPassword = ""
    }
    
    public func changePassword(using task: ChangePasswordTask) -> Bool {
        let ok = task.changePassword(withNew: newPassword, currentPassword: currentPassword, currentEmail: currentEmail) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        newPassword = ""
        currentEmail = ""
        currentPassword = ""
        return ok
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> ChangePasswordOperationParameter & ChangePasswordOperator {
        completion = aCompletion
        return self
    }
    
    public func withNewPassword(_ password: String) -> ChangePasswordOperationParameter & ChangePasswordOperator {
        newPassword = password
        return self
    }
    
    public func withCurrentEmail(_ email: String) -> ChangePasswordOperationParameter & ChangePasswordOperator {
        currentEmail = email
        return self
    }
    
    public func withCurrentPassword(_ password: String) -> ChangePasswordOperationParameter & ChangePasswordOperator {
        currentPassword = password
        return self
    }
}
