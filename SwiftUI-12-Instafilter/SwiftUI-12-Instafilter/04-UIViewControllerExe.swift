//
//  04-UIViewControllerExe.swift
//  SwiftUI-12-Instafilter
//
//  Created by Esteban Cruz on 26/9/24.
//

import SwiftUI

struct _4_UIViewControllerExe: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                showingImagePicker = true
            }
            
            Button("Save Image") {
                guard let inputImage = inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

#Preview {
    _4_UIViewControllerExe()
}
