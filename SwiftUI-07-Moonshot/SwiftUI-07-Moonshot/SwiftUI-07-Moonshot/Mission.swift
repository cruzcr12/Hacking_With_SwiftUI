//
//  Mission.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 16/1/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    // Nested struct cause this is only being used by Mission struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date? //Optional property
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedLaunchDateLong: String {
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
}
