//
//  03_ManualPublish.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 28/11/24.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct _3_ManualPublish: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

#Preview {
    _3_ManualPublish()
}
