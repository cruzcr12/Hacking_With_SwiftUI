//
//  05-TouchIdExample.swift
//  SwiftUI-13-BucketList
//
//  Created by Esteban Cruz on 11/10/24.
//

import SwiftUI
import LocalAuthentication

struct _5_TouchIdExample: View {
    // This will store whether the app is showing its protected data or not
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        // Check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    _5_TouchIdExample()
}
