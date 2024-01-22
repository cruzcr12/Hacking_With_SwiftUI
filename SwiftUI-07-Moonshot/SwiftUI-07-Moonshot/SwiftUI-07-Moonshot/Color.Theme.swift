//
//  Color.Theme.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 17/1/24.
//

import Foundation
import SwiftUI

// Creates an extension of ShapeStyle only when we are extending Color
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
