//
//  04-ImageSaver.swift
//  SwiftUI-12-Instafilter
//
//  Created by Esteban Cruz on 30/9/24.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    
    func writeToPhotoAlbum(image: UIImage){
       UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        // If there is an error, pass the error to the errorHandler
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
