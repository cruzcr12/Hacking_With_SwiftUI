//
//  03-GroupsAsContainers.swift
//  SwiftUI-18-SnowSeeker
//
//  Created by Esteban Cruz on 10/6/25.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct _3_GroupsAsContainers: View {
    /*
     @State private var layoutVertically = false
     
     var body: some View {
     Group {
     if layoutVertically {
     VStack {
     UserView()
     }
     } else {
     HStack {
     UserView()
     }
     }
     }
     .onTapGesture {
     layoutVertically.toggle()
     }
     }
     */
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
    
}

#Preview {
    _3_GroupsAsContainers()
}
