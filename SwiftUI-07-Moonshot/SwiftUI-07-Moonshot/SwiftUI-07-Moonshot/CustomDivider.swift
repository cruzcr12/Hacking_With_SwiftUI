//
//  CustomDivider.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 22/1/24.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
