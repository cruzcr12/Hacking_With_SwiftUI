//
//  FileManager-DocumentsDirectory.swift
//  SwiftUI-13-BucketList
//
//  Created by Esteban Cruz on 23/10/24.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                 in: .userDomainMask)
        return paths[0]
    }
}
