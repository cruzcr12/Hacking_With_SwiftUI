//
//  06-SpecificAccessiblity.swift
//  SwiftUI-16-Flashzilla
//
//  Created by Esteban Cruz on 15/5/25.
//

import SwiftUI

struct _6_SpecificAccessiblity: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @State private var scale = 1.0
    
    var body: some View {
        useDifferentiateWithoutColor()
        useReduceMotion()
        useReduceTransparency()
    }
    
    func useReduceTransparency() -> some View {
        return Text("Hello, world!")
            .padding()
            .background(reduceTransparency ? Color.black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    func useReduceMotion() -> some View {
        return Text("Hello, world!")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default,
                                       _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
    func useDifferentiateWithoutColor() -> some View {
        return HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
    
}

#Preview {
    _6_SpecificAccessiblity()
}
