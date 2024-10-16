//
//  ContentView.swift
//  card-game
//
//  Created by Eirik Andresen on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "👽", "💀", "🧙‍♀️", "🧟‍♀️", "🕸️", "🧛‍♂️", "☠️"]
    
    var body: some View {
        ScrollView {
                cards
        }
        .padding()
    }
    
    var cards: some View {
        // implicit return if its only one line of code
        // this code creates an LazyVGrid and then modifies it
        // LazyVGrid uses as LITTLE space as it can, HStack uses a MUCH space as it can
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            // the ForEach is saying: give me the view u want for each of theese things
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
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
