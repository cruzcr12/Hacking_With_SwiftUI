//
//  01-TwoViews.swift
//  SwiftUI-18-SnowSeeker
//
//  Created by Esteban Cruz on 10/6/25.
//

import SwiftUI

struct _1_TwoViews: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")
            
            Text("Secondary")
        }
    }
}



#Preview {
    _1_TwoViews()
}
