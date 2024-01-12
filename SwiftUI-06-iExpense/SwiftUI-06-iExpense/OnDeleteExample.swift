//
//  OnDeleteExample.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 8/1/24.
//

import SwiftUI

struct OnDeleteExample: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    OnDeleteExample()
}
