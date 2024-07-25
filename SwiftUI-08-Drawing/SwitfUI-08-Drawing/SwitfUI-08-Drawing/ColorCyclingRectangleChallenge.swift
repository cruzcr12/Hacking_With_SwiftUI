//
//  ColorCyclingRectangle.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 8/2/24.
//

import SwiftUI

/*
struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)
                        ]), startPoint: .top, endPoint: .bottom),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
 */

struct ColorCyclingRectangle : Shape {
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path

    }
    
}

struct ColorCyclingRectangleChallenge: View {
    @State private var topX = 0.0
    @State private var topY = 0.0
    @State private var bottomX = 1.0
    @State private var bottomY = 1.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.black]),
                        startPoint: UnitPoint(x: topX, y: topY),
                        endPoint: UnitPoint(x: bottomX, y: bottomY))
                )
                .frame(width: 300, height: 300)
                .padding([.bottom])
                
            HStack {
                Text("Top X")
                    .frame(width: 80, alignment: .leading)
                Slider( value: $topX)
            }.frame(width: 300, alignment: .leading)
            
            HStack{
                Text("Top Y")
                    .frame(width: 80, alignment: .leading)
                Slider( value: $topY)
            }.frame(width: 300)
            
            HStack{
                Text("Bottom X")
                    .frame(width: 80, alignment: .leading)
                Slider( value: $bottomX)
            }.frame(width: 300)
            
            HStack{
                Text("Bottom Y")
                    .frame(width: 80, alignment: .leading)
                Slider( value: $bottomY)
            }.frame(width: 300)
            
        }
    }
}

#Preview {
    ColorCyclingRectangleChallenge()
}
