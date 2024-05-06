//
//  CustomPathEx.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 24/1/24.
//

import SwiftUI

struct CustomPathEx: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath() //Indicates this is the end of the path
        }
        //.fill(.red)  //This is a way to color the figure
        //.stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

#Preview {
    CustomPathEx()
}
