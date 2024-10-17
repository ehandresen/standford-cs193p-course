//
//  EmojiMemoryGame.swift
//  card-game
//
//  Created by Eirik Andresen on 16/10/2024.
//

import SwiftUI
// we import SwiftUI because your ViewModel is part of the UI
// the ViewModel is 'packaging' up the model for the UI, so it HAS to know what the UI looks like
// BUT the ViewModel is NOT going to be creating Views or any off that stuff (but it knows about Images, Colors etc)

// this is the ViewModel
class EmojiMemoryGame {
    private var model = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in // trailing closure syntax
        return ["👻", "🎃", "🕷️", "😈", "👽", "💀", "🧙‍♀️", "🧟‍♀️", "🕸️", "🧛‍♂️", "☠️"][pairIndex]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
