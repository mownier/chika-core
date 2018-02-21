//
//  ImageUploaderOperationTests.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/21/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
import ChikaCore

class ImageUploaderOperationTests: XCTestCase {
    
    var uploader: ImageUploader!
    var operation: ImageUploaderOperation!
    
    override func setUp() {
        super.setUp()
        
        uploader = ImageUploaderMock()
        operation = ImageUploaderOperation()
    }
    
    func testUploadImageA() {
        var ok = operation.uploadImage(using: uploader)
        XCTAssertFalse(ok)
        
        ok = operation.withImage({
            UIImage()
        }).uploadImage(using: uploader)
        XCTAssertTrue(ok)
        
        ok = operation.onProgress({
            print($0 == nil ? "no progress" : "has progress")
            
        }).withImage({
            UIImage()
            
        }).uploadImage(using: uploader)
        XCTAssertTrue(ok)
    }
    
    func testUploadImageB() {
        let exp = expectation(description: "testUploadImageB")
        let completion: (Result<URL>) -> Void = { _ in
            exp.fulfill()
        }
        let ok = operation.onProgress({
            print($0 == nil ? "no progress" : "has progress")
            
        }).withImage({
            UIImage()
            
        }).withCompletion({
            completion($0)
            
        }).uploadImage(using: uploader)
        
        XCTAssertTrue(ok)
        wait(for: [exp], timeout: 1.0)
    }
    
}
