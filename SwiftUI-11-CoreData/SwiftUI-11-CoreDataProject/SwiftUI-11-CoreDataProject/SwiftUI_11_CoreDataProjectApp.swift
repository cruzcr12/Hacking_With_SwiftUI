//
//  SwiftUI_11_CoreDataProjectApp.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 21/8/24.
//

import SwiftUI

@main
struct SwiftUI_11_CoreDataProjectApp: App {
    // Create the data controller instance
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //_4_DynamicFiltering()
            _5_RelationshipsExample()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}
