//
//  ScrollingGridExample.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 15/1/24.
//

import SwiftUI

struct ScrollingGridExample: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollingGridExample()
}
