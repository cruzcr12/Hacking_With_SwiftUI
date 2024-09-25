//
//  01-PropWrapperExe.swift
//  SwiftUI-12-Instafilter
//
//  Created by Esteban Cruz on 15/9/24.
//

import SwiftUI

struct _1_PropWrapperExe: View {
    
    @State private var blurAmount = 0.0
        
    var body: some View {
        VStack{
            Text("Hello world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { newValue in
                    print("New value is \(newValue)")
                }
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    _1_PropWrapperExe()
}
