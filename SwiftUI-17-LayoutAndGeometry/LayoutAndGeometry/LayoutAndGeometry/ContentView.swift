//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Esteban Cruz on 26/5/25.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .pink]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % colors.count])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).midY - fullView.size.height / 2 ) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
