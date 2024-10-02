//
//  03-CoreImageExe.swift
//  SwiftUI-12-Instafilter
//
//  Created by Esteban Cruz on 26/9/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct _3_CoreImageExe: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        // Load he image into a UIImage
        guard let inputImage = UIImage(named: "example") else { return }
        // Convert the UIImage into a CIImage
        let beginImage = CIImage(image: inputImage)
        // Create a context
        let context = CIContext()
        // Create a filter usine sepia tone
        let currentFilter = CIFilter.sepiaTone()
        // Apply the filter
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        // Get a CIImage from the filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        // Attempt to get a CGImage from or CIImage
        if let cgimg = context.createCGImage(outputImage,
                                             from: outputImage.extent) {
            // Convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            // And convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
        
    }
}

#Preview {
    _3_CoreImageExe()
}
