//
//  ScrollViewExample.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 15/1/24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String){
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10){
                ForEach(0..<100){
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollViewExample()
}
