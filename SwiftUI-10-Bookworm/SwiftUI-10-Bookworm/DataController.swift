//
//  DataController.swift
//  SwiftUI-10-Bookworm
//
//  Created by Esteban Cruz on 15/5/24.
//

import CoreData

class DataController: ObservableObject {
    // Core Data type responsible for loading a data model
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
