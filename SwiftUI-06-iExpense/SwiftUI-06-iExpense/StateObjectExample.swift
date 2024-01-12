//
//  StateObjectExample.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 11/12/23.
//

import SwiftUI

class User1 : ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct StateObjectExample: View {
    @StateObject var user = User1()

    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name",  text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
    }
}

#Preview {
    StateObjectExample()
}


