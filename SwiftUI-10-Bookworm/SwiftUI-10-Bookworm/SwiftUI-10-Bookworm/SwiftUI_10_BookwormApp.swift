//
//  SwiftUI_10_BookwormApp.swift
//  SwiftUI-10-Bookworm
//
//  Created by Esteban Cruz on 7/5/24.
//

import SwiftUI

@main
struct SwiftUI_10_BookwormApp: App {
    // Creates the data controller
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}
