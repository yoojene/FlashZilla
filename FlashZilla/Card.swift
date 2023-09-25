//
//  Card.swift
//  FlashZilla
//
//  Created by Eugene on 25/09/2023.
//

import Foundation


struct Card: Identifiable, Codable {
    let id: UUID
    let prompt: String
    let answer: String
    
    static let example = Card(id: UUID(), prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
}
