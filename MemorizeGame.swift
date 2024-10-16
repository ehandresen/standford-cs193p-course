//
//  MemorizeGame.swift
//  card-game
//
//  Created by Eirik Andresen on 16/10/2024.
//

import Foundation
// Foundation has nothing to do with UI, it includes things like arrays, ints, bools, dictionaries and so on

struct MemoryGame<CardContent> {
    // when getting started building models, ask yourself:
    // - what does this thing do?
    // - what data does it have assossiated with it?
    // try to make it clear in your mind somewhat, to get u going, even if u might change things down the line
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    // nested struct
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
