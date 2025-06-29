//
//  SkiDetailsView.swift
//  SwiftUI-18-SnowSeeker
//
//  Created by Esteban Cruz on 13/6/25.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title3)
            }
            
            VStack{
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    SkiDetailsView(resort: Resort.example)
}
