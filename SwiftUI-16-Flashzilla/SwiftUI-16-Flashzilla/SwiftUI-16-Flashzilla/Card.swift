//
//  Card.swift
//  SwiftUI-16-Flashzilla
//
//  Created by Esteban Cruz on 16/5/25.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
