//
//  NavigationLinkExample.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 15/1/24.
//

import SwiftUI

struct NavigationLinkExample: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationLinkExample()
}
