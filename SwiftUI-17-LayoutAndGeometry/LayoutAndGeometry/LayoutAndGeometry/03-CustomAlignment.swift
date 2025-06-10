//
//  03-CustomAlignment.swift
//  LayoutAndGeometry
//
//  Created by Esteban Cruz on 30/5/25.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName =
        VerticalAlignment(MidAccountAndName.self)
}

struct _3_CustomAlignment: View {
    var body: some View {
        HStack {
            VStack {
                Text("@bartsimpson")
                    .alignmentGuide(.midAccountAndName){ d in
                        d[VerticalAlignment.center] }
                Image("Bart")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("BART SIMPSON")
                    .alignmentGuide(.midAccountAndName){ d in
                        d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
    
}

#Preview {
    _3_CustomAlignment()
}
