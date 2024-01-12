//
//  StoringUserSettings.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 8/1/24.
//

import SwiftUI

struct StoringUserSettings: View {
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)"){
            tapCount += 1
        }
    }
}

#Preview {
    StoringUserSettings()
}
