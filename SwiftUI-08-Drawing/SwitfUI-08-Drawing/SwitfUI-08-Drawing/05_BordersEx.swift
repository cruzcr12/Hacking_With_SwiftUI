//
//  BordersEx.swift
//  SwitfUI-08-Drawing
//
//  Created by cradmin on 25/1/24.
//

import SwiftUI

struct BordersEx: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("mountain"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), lineWidth: 20)
            .frame(width: 300, height: 200)
        
        Text("Hello World")
          .frame(width: 300, height: 300)
          .border(ImagePaint(image: Image("mountain"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
    }
}

#Preview {
    BordersEx()
}
