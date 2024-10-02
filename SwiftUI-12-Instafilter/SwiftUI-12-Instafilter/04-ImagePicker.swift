//
//  04-ImagePicker.swift
//  SwiftUI-12-Instafilter
//
//  Created by Esteban Cruz on 26/9/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Tell the picker to go away
            picker.dismiss(animated: true)
            
            // Exit if no selection was made
            guard let provider = results.first?.itemProvider else { return }
            
            // If this has an image we can use, use it
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
    }
    
    @Binding var image: UIImage?
    
    typealias UIViewControllerType = PHPickerViewController
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        // Creates a new photo picker configuration asking to provide only images
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        
        // Tells the PHPickerViewController that when something happens it should inform the coordinator.
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    // SwiftUI will automatically call this method if we implement it
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
        
}

