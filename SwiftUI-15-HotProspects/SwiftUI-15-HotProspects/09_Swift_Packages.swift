//
//  09_Swift_Packages.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 19/12/24.
//

import SwiftUI
import SamplePackage

struct _9_Swift_Packages: View {
    let possibleNumbers = Array(1...60)
    
    var results: String {
        // Get 7 random numbers from the array
        let selected = possibleNumbers.random(7).sorted()
        // Convert the array into String
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    _9_Swift_Packages()
}
