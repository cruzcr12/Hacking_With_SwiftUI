//
//  2_TextEditor_Example.swift
//  SwiftUI-10-Bookworm
//
//  Created by Esteban Cruz on 8/5/24.
//

import SwiftUI


struct TextEditor_Example: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    TextEditor_Example()
}

