//
//  04-ViewSearchable.swift
//  SwiftUI-18-SnowSeeker
//
//  Created by Esteban Cruz on 11/6/25.
//

import SwiftUI

struct _4_ViewSearchable: View {
    @State private var searchText: String = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var body: some View {
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    _4_ViewSearchable()
}
