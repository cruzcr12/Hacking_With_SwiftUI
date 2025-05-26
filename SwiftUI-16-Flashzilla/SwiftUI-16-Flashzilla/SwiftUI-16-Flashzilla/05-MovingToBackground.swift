//
//  05-MovingToBackground.swift
//  SwiftUI-16-Flashzilla
//
//  Created by Esteban Cruz on 15/5/25.
//

import SwiftUI

struct _5_MovingToBackground: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    _5_MovingToBackground()
}
