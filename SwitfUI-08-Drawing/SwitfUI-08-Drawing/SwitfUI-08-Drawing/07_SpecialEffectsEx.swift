//
//  SpecialEffectsEx.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 26/1/24.
//

import SwiftUI

struct SpecialEffectsEx: View {
    @State private var amount = 0.0
    
    var body: some View {
        
        VStack {
            Image("mountain")
                .resizable()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        
        // Screen Mode Example
        /*
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
         */
        
        // Multiply Effect
        /*
        ZStack {
            Image("mountain")
                .colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
         */
    }
}

#Preview {
    SpecialEffectsEx()
}
