//
//  ImageUploader.swift
//  ChikaCore
//
//  Created by Mounir Ybanez on 2/21/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol ImageUploader {

    @discardableResult
    func uploadImage(_ image: UIImage, onProgress: ((Progress?) -> Void)?, completion: @escaping (Result<URL>) -> Void) -> Bool
}

public protocol ImageUploaderOperator {
    
    func onProgress(_ block: @escaping (Progress?) -> Void) -> ImageUploaderOperator
    
    func withImage(_ image: @escaping () -> UIImage) -> ImageUploaderOperator
    func withCompletion(_ completion: @escaping (Result<URL>) -> Void) -> ImageUploaderOperator
    
    @discardableResult
    func uploadImage(using uploader: ImageUploader) -> Bool
}

public class ImageUploaderOperation: ImageUploaderOperator {
    
    var image: (() -> UIImage)?
    var onProgress: ((Progress?) -> Void)?
    var completion: ((Result<URL>) -> Void)?
    
    public init() {
    }
    
    public func onProgress(_ block: @escaping (Progress?) -> Void) -> ImageUploaderOperator {
        onProgress = block
        return self
    }
    
    public func withImage(_ anImage: @escaping () -> UIImage) -> ImageUploaderOperator {
        image = anImage
        return self
    }
    
    public func withCompletion(_ aCompletion: @escaping (Result<URL>) -> Void) -> ImageUploaderOperator {
        completion = aCompletion
        return self
    }
    
    @discardableResult
    public func uploadImage(using uploader: ImageUploader) -> Bool {
        defer {
            image = nil
            completion = nil
        }
        
        guard image != nil else {
            return false
        }
        
        let callback = completion
        let ok = uploader.uploadImage(image!(), onProgress: onProgress) { result in
            callback?(result)
        }
        
        return ok
    }
    
}
