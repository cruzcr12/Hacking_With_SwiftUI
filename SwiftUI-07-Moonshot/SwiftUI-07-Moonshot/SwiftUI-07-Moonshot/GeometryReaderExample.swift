//
//  GeometryReader.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 12/1/24.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        
        GeometryReader { geo in
            Image("Landscape")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                // This second frame will contain the first one and will align it in the center
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    GeometryReaderExample()
}
