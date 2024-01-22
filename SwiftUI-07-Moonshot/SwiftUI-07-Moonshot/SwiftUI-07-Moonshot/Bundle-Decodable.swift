//
//  Bundle-Decodable.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 16/1/24.
//

import Foundation

extension Bundle {
    // Function that reads a file and returns a dictionary of type [string, astronaut]
    func decode<T: Codable>(_ file: String) -> T {
        // Find that file in our installed app bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // If file was found, try to load it
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        // If it was loaded, decode it
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
