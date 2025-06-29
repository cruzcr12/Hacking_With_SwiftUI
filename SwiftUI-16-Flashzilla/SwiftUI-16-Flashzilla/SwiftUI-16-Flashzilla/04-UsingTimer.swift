//
//  04-UsingTimer.swift
//  SwiftUI-16-Flashzilla
//
//  Created by Esteban Cruz on 15/5/25.
//

import SwiftUI

struct _4_UsingTimer: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            }
    }
}

#Preview {
    _4_UsingTimer()
}
