//
//  Challenge.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 7/2/24.
//

import SwiftUI

struct Arrow: InsettableShape {
    
    var insetAmount = 0.0
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Starting from left
        path.move(to: CGPoint(x: rect.minX + 50, y: rect.midY ))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + 150))
        path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.midY ))
        path.addLine(to: CGPoint(x: rect.maxX - 150, y: rect.midY ))
        // Starting base of the arrow from the right
        path.addLine(to: CGPoint(x: rect.maxX - 150, y: rect.midY + 200))
        path.addLine(to: CGPoint(x: rect.minX + 150, y: rect.midY + 200))
        path.addLine(to: CGPoint(x: rect.minX + 150, y: rect.midY + 200))
        path.addLine(to: CGPoint(x: rect.minX + 150, y: rect.midY ))
        path.addLine(to: CGPoint(x: rect.minX + 50, y: rect.midY ))
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct Challenge: View {
    @State private var insetAmount = 10.0
    
    var body: some View {
        Arrow()
            .stroke(.red, style: StrokeStyle(lineWidth: insetAmount, lineCap: .round, lineJoin: .round))
            .onTapGesture {
                withAnimation{
                    insetAmount = Double.random(in: 10...50)
                }
            }
    }
}

#Preview {
    Challenge()
}
