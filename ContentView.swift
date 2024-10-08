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
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        // implicit return if its only one line of code
        // this code creates an LazyVGrid and then modifies it
        // LazyVGrid uses as LITTLE space as it can, HStac uses a MUCH space as it can
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            // the ForEach is saying: give me the view u want for each of theese things
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
    
    // 'by' is the external parameter name used when calling the function
    // 'offset' is the internal parameter name used inside the function's body
    // 'symbol' is used as both the external and internal parameter name
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        // again implicit return becuase one line of code so return is unessassery
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
    }
}

struct CardView: View {
    // let doesn't need a default value
    let content: String
    
    // all structs with a var need a value
    @State var isFaceUp = true
    
    var body: some View {
        ZStack { // called trailing closure syntax
            
            // let = constant
            // RoundedRectangle is infered as the type
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.purple)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1) // 0 is fully transparent, 1 is fully opaque
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
