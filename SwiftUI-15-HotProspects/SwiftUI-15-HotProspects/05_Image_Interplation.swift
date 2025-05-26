//
//  05_Image_Interplation.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 19/12/24.
//

import SwiftUI

struct _5_Image_Interplation: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight:.infinity )
            .background(.black)
            .ignoresSafeArea()
    }
}

#Preview {
    _5_Image_Interplation()
}
