//
//  MemoryGame.swift
//  card-game
//
//  Created by Eirik Andresen on 16/10/2024.
//

import Foundation
// Foundation has nothing to do with UI, it includes things like arrays, ints, bools, dictionaries and so on

// this is the Model
struct MemoryGame<CardContent> {
    // when getting started building models, ask yourself:
    // - what does this thing do?
    // - what data does it have assossiated with it?
    // try to make it clear in your mind somewhat, to get u going, even if u might change things down the line
    
    // only setting this vaiable is private, looking at the variable is allowed
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOdCards * 2 cards
        // FOR control variable IN iteratable thing
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(card: Card) {
        
    }
    // nested struct
    struct Card {
        var isFaceUp = false
        var isMatched = false
        // THE CONTENT OF THE CARD DOES NOT CHANGE
        let content: CardContent
    }
}
