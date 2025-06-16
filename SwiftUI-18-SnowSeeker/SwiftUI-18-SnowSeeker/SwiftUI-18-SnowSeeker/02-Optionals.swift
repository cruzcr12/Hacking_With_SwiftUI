//
//  02-Optionals.swift
//  SwiftUI-18-SnowSeeker
//
//  Created by Esteban Cruz on 10/6/25.
//

import SwiftUI

struct User: Identifiable {
    var id = "John Wick"
}

struct _2_Optionals: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
            }
    }
}

#Preview {
    _2_Optionals()
}
