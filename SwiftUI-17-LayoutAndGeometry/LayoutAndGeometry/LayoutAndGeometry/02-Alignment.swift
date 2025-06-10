//
//  02-Alignment.swift
//  LayoutAndGeometry
//
//  Created by Esteban Cruz on 27/5/25.
//

import SwiftUI

struct _2_Alignment: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _
                        in CGFloat(position) *
                        -10 }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
        
        // Using alignmentGuide
        /*
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .alignmentGuide(.leading) { d in d[.trailing]}
            Text("This is a longer line of text")
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
         */
        
        /*Text("Live long and prosper")
            .frame(width: 300, height: 300, alignment: .topLeading)
        */
        /*
        HStack(alignment: .lastTextBaseline) {
            Text("Live").font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper").font(.largeTitle)
        }
         */
    }
    
    

}

#Preview {
    _2_Alignment()
}
