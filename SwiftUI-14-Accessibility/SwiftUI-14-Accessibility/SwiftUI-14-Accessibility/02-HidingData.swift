//
//  02-HidingData.swift
//  SwiftUI-14-Accessibility
//
//  Created by Esteban Cruz on 27/10/24.
//

import SwiftUI

struct _2_HidingData: View {
    var body: some View {
        Image(decorative: "character")
            .accessibilityHidden(true)
        
        
        VStack {
            Text("Your score is")
            Text("100")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 100")
        
    }
}

#Preview {
    _2_HidingData()
}
