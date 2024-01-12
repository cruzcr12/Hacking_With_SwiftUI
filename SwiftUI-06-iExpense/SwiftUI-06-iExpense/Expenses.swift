//
//  Expenses.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 8/1/24.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet {            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Have an initializer that will read the values and load them into the items array
    init(){
        // Read the data from user defaults, if it exists
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            // If the data exists, try to decode it
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        
        // If it was not able to load the saved data, load an empty array
        items = []
    }
}
