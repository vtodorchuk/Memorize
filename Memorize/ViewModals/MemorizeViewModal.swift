//
//  MemorizeViewModal.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 24.12.2024.
//

import SwiftUI

class MemorizeViewModal: ObservableObject {
    static let animaslEmojies = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    
    var selectedTheme = Theme.animals
    
    @Published private var game = MemorizeGame(pairs: 8) { index in
        animaslEmojies[index]
    }
    
    var cards: [MemorizeGame<String>.Card] { game.cards }
    
    var score: Int {
        game.score
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemorizeGame<String>.Card) { game.choose(card) }
    
    func changeTheme(_ theme: Theme) {
        if theme == selectedTheme {
            game.shuffle()
            return
        }
        selectedTheme = theme
        
        game = MemorizeGame(pairs: 8) { index in
            selectedTheme.emojis[index]
        }
        
        game.shuffle()
    }
}
