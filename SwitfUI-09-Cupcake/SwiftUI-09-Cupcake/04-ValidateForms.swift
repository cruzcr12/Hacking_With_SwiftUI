//
//  04-ValidateForms.swift
//  SwiftUI-09-Cupcake
//
//  Created by cradmin on 8/3/24.
//

import SwiftUI

struct _4_ValidateForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            //.disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    _4_ValidateForms()
}
