//
//  1_Binding_Example.swift
//  SwiftUI-10-Bookworm
//
//  Created by Esteban Cruz on 7/5/24.
//
import SwiftUI
import Foundation

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: isOn ? onColors : offColors),
                startPoint: .top,
                endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
        
        
    }
    
}

struct Binding_Example: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
    }
}

#Preview {
    Binding_Example()
}

