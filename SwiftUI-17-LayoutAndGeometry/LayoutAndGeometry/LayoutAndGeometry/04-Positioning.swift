//
//  04-Positioning.swift
//  LayoutAndGeometry
//
//  Created by Esteban Cruz on 4/6/25.
//

import SwiftUI

struct _4_Positioning: View {
    var body: some View {
        // Position example
        /*
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .position(x: 100, y: 100)
            .background(Color.red)
        */
        
        // Offset example
        Text("Hello, World!")
            .background(Color.red)
            .offset(x: 100, y: 100)
            
    }
}

#Preview {
    _4_Positioning()
}
