//
//  02-MultipleOptsExe.swift
//  SwiftUI-12-Instafilter
//
//  Created by Esteban Cruz on 24/9/24.
//

import SwiftUI

struct _2_MultipleOptsExe: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change background", isPresented: $showingConfirmation){
                Button("Red") { backgroundColor = .red}
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel){ }
            } message: {
                Text("Select a new color")
            }
    }
}

#Preview {
    _2_MultipleOptsExe()
}
