//
//  ImageUploaderMock.swift
//  ChikaCoreTests
//
//  Created by Mounir Ybanez on 2/21/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaCore

class ImageUploaderMock: ImageUploader {

    func uploadImage(_ image: UIImage, onProgress: ((Progress?) -> Void)?, completion: @escaping (Result<URL>) -> Void) -> Bool {
        onProgress?(Progress.current())
        
        let url = URL(string: "https://chika.com")!
        completion(.ok(url))
        return true
    }
    
}
