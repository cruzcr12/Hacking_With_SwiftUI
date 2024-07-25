//
//  AnimatablePairEx.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 7/2/24.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
             AnimatablePair(Double(rows), Double(columns))
          }
          set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                // Decide if the square is colored by identifying if it is multiple of 2
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    // Draw the square
                    let rect = CGRect(x: startX, y: startY, width:
                                        columnSize, height: rowSize)
                    path.addRect(rect)
                }
            } }
        return path }
}

struct AnimatablePairEx: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)){
                    rows = 8
                    columns = 16
                }
            }
    }
}

#Preview {
    AnimatablePairEx()
}
