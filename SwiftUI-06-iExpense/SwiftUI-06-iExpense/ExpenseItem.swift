//
//  ExpenseItem.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 8/1/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    // Generate a UUID automatically for every item
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
