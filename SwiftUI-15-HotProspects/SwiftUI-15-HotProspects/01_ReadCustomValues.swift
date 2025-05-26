//
//  01_ReadCustomValues.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 27/11/24.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Corey Taylor"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View{
        Text(user.name)
    }
}

struct _1_ReadCustomValues: View {
    @StateObject private var user = User()
       
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }.environmentObject(user)
    }
}

#Preview {
    _1_ReadCustomValues()
}
