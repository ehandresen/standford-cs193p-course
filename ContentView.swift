//
//  ContentView.swift
//  card-game
//
//  Created by Eirik Andresen on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "👽", "💀", "🧙‍♀️", "🧟‍♀️", "🕸️", "🧛‍♂️", "☠️"]
    
    // can't change cardCount without adding '@State'
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            // the ForEach is saying: give me the view u want for each of theese things
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardRemover: some View {
        // this is how u would make a button that is a symbol instead of text
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
        })
    }
}

struct CardView: View {
    // let doesn't need a default value
    let content: String
    
    // all structs with a var need a value
    @State var isFaceUp = false
    
    
    var body: some View {
        ZStack { // called trailing closure syntax
            
            // let = constant
            // RoundedRectangle is infered as the type
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
            
        }
        .onTapGesture {
            //isFaceUp = !isFaceUp, is same as under
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
