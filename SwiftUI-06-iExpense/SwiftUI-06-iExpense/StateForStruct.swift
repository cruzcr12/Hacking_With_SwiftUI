//
//  StateForStruct.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 6/12/23.
//

import SwiftUI

class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct StateForStruct: View {
    @State private var user = User()

    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name",  text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
    }
}

#Preview {
    StateForStruct()
}

