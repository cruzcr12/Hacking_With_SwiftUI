//
//  DataController.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 21/8/24.
//

import CoreData

class DataController: ObservableObject {
    // Core Data type responsible for loading a data model
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
