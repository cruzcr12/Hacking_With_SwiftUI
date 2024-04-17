//
//  03-AsyncImageExample.swift
//  SwiftUI-09-Cupcake
//
//  Created by cradmin on 5/3/24.
//

import SwiftUI

struct _3_AsyncImageExample: View {
    var body: some View {
        
        //Showing a placeholder before loading the image, this can be changed by a progress view
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
        { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.red
        }
        .frame(width: 200, height: 200)
        
        
        AsyncImage(url: URL(string: "https//hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }            
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    _3_AsyncImageExample()
}
