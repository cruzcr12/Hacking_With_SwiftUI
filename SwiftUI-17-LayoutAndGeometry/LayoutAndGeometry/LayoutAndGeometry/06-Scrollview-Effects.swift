//
//  06-Scrollview-Effects.swift
//  LayoutAndGeometry
//
//  Created by Esteban Cruz on 4/6/25.
//

import SwiftUI

struct _6_Scrollview_Effects: View {

    //
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .pink]
      
    /*
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
    */
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                    
                }
            }
        }
    }
    
}

#Preview {
    _6_Scrollview_Effects()
}
