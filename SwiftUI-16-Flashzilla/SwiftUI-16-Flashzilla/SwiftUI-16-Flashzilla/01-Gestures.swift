//
//  01-Gestures.swift
//  SwiftUI-16-Flashzilla
//
//  Created by Esteban Cruz on 13/5/25.
//

import SwiftUI

struct _1_Gestures: View {
    //@State private var currentAmount = Angle.zero
    //@State private var finalAmount = Angle.zero
    
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets
        // its offset to whatever we had back from the drag gesture, and
        // uses our combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    
        /* Priority */
        /*
        VStack {
            Text("Testing onTapGesture")
                .onTapGesture {
                    print("Text tapped!")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded{
                    print("VStack tapped!")
                }
        )
        */
        
        /* Rotation Gesture */
        /*Text("Hello, world!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        currentAmount = angle
                    }
                    .onEnded { angle in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    }
            )
         */
        
        /* Magnification gesture*/
        /*
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
        */
            /*.onLongPressGesture(minimumDuration: 2){
                print("Long pressed")
            } onPressingChanged: {inProgress in
                print("In progress: \(inProgress)!")
            }*/
    }
}

#Preview {
    _1_Gestures()
}
