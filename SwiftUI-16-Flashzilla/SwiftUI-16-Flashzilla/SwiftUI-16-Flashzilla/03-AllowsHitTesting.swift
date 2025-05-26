//
//  03-AllowsHitTesting.swift
//  SwiftUI-16-Flashzilla
//
//  Created by Esteban Cruz on 15/5/25.
//

import SwiftUI

struct _3_AllowsHitTesting: View {
    var body: some View {
        //showFigureone()
        showFiguretwo()
    }
    
    func showFigureone() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(Color.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }
                //.allowsHitTesting(false)
        }
    }
    
    func showFiguretwo() -> some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    _3_AllowsHitTesting()
}
