//
//  02_TabView.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 28/11/24.
//

import SwiftUI

struct _2_TabView: View {
    // Keep track of the current tab
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    _2_TabView()
}
