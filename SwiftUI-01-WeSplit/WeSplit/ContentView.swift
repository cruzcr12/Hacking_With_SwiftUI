//
//  ContentView.swift
//  WeSplit
//
//  Created by Esteban Alonso Cruz Hidalgo on 30/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    // Property that calculates the total per person
    var totalPerPerson: Double {
        // The picker starts with 2, so we need to add 2 to the value
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    var currencyType: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section{
                        TextField("Amount", value: $checkAmount, format: currencyType)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        
                        Picker("Number of people", selection: $numberOfPeople){
                            ForEach(2 ..< 100){
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0..<101){
                                Text($0, format: .percent)
                            }
                            
                            /*ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }*/
                        }
                        //.pickerStyle(.segmented)
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                    
                    
                    Section{
                        Text(totalPerPerson, format: currencyType)
                    } header: {
                        Text("Amount per person")
                    }
                    
                    Section {
                        Text(totalAmount, format: currencyType)
                            .foregroundColor(tipPercentage == 0 ? .red : .black)
                    } header: {
                        Text("Total amount")
                    }
                }
                .navigationTitle("We Split")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
