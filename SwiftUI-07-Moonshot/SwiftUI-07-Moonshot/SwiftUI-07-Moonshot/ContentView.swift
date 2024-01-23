//
//  ContentView.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 12/1/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var body: some View {
        
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Switch View"){
                        print(showingGrid)
                        showingGrid.toggle()
                    }
                }
            }
            
        }

    }

 
}

#Preview {
    ContentView()
}
