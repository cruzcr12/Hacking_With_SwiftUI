//
//  StrokeBorderEx.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 25/1/24.
//

import SwiftUI

struct StrokeBorderEx: View {
    var body: some View {
        Circle()
            .strokeBorder(.blue, lineWidth: 40)
        
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

#Preview {
    StrokeBorderEx()
}
