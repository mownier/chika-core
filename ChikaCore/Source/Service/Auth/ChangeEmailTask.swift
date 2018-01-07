//
//  ChangeEmailTask.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public protocol ChangeEmailTask {

    func changeEmail(withNew: String, currentEmail: String, currentPassword: String, completion: @escaping (Result<OK>) -> Void) -> Bool
}

public protocol ChangeEmailOperator {
    
    func changeEmail(using task: ChangeEmailTask) -> Bool
}

public protocol ChangeEmailOperationParameter {
    
    func withNewEmail(_ email: String) -> ChangeEmailOperationParameter & ChangeEmailOperator
    func withCompletion(_ completion: @escaping (Result<OK>) -> Void) -> ChangeEmailOperationParameter & ChangeEmailOperator
    func withCurrentEmail(_ email: String) -> ChangeEmailOperationParameter & ChangeEmailOperator
    func withCurrentPassword(_ password: String) -> ChangeEmailOperationParameter & ChangeEmailOperator
}

public class ChangeEmailOperation: ChangeEmailOperationParameter, ChangeEmailOperator {
    
    var newEmail: String
    var completion: ((Result<OK>) -> Void)?
    var currentEmail: String
    var currentPassword: String
    
    public init() {
        self.newEmail = ""
        self.currentEmail = ""
        self.currentPassword = ""
    }
    
    public func changeEmail(using task: ChangeEmailTask) -> Bool {
        let ok = task.changeEmail(withNew: newEmail, currentEmail: currentEmail, currentPassword: currentPassword) { [weak self] result in
            self?.completion?(result)
            self?.completion = nil
        }
        newEmail = ""
        currentEmail = ""
        currentPassword = ""
        return ok
    }
    
    public func withNewEmail(_ email: String) -> ChangeEmailOperationParameter & ChangeEmailOperator {
        newEmail = email
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<OK>) -> Void) -> ChangeEmailOperationParameter & ChangeEmailOperator {
        completion = aCompletion
        return self
    }
    
    public func withCurrentEmail(_ email: String) -> ChangeEmailOperationParameter & ChangeEmailOperator {
        currentEmail = email
        return self
    }
    
    public func withCurrentPassword(_ password: String) -> ChangeEmailOperationParameter & ChangeEmailOperator {
        currentPassword = password
        return self
    }
}
