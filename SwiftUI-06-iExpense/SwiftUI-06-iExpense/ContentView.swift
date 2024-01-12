//
//  ContentView.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    // Make an instance of expenses. The @StateObject asks SwiftUI
    // to watch the object for any change announcements
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    // Get only business items
    /*var businessItems: [ExpenseItem] {
        return expenses.items.filter { $0.type == "Business" }
    }*/
    
    var body: some View {
        NavigationView {
            List {
                
                Section("Business") {
                    ForEach(expenses.items , id: \.id) { item in
                        if item.type == "Business"{
                            HStack {
                                VStack {
                                    Text(item.name)
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                    Text(item.type)
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(getAmountColor(item.amount))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Personal") {
                    ForEach(expenses.items, id: \.id) { item in
                        if item.type == "Personal" {
                            HStack {
                                VStack {
                                    Text(item.name)
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                    Text(item.type)
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .expenseStyle(for: item)
                                //.foregroundColor(getAmountColor(item.amount))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func getAmountColor(_ amount: Double) -> Color {
        if amount <= 10.0 {
            return .green
        } else if amount > 10 && amount <= 100 {
            return .black
        } else {
            return .red
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove (atOffsets: offsets)
    }
}


/**
 ViewModifier to define a specific style depending of the amount of the expense item
 */
struct ExpenseStyle: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundColor(.green)
                .bold()
        case 10..<100:
            content.foregroundColor(.black)
        default:
            content
                .foregroundColor(.red)
                .bold()
        }
    }
}

/**
 Extension to be able to use the expsnseStyle
 */
extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}


#Preview {
    ContentView()
}
