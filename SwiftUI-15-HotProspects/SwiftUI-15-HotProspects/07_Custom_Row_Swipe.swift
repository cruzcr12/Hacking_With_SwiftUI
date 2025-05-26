//
//  07_Custom_Row_Swipe.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 19/12/24.
//

import SwiftUI

struct _7_Custom_Row_Swipe: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Hi")
                    } label: {
                        Label("Send message", systemImage: "message")
                    }
                }
                .swipeActions(edge: .leading){
                    Button{
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    _7_Custom_Row_Swipe()
}
