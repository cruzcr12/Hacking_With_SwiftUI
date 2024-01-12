//
//  SecondView.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 11/12/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct FirstView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet){
            SecondView(name: "Esteban")
        }
    }
}

#Preview {
    FirstView()
}
