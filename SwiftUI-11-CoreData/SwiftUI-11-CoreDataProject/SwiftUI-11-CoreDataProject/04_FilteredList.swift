//
//  04_FilteredList.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 22/8/24.
//
import CoreData
import SwiftUI

struct _4_FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    // This is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self){ item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        // Initialize the view with a fetch request with a predicate that uses the filter
        // by using the _ we are requesting new results to load
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "&K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

