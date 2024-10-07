//
//  ContentView.swift
//  card-game
//
//  Created by Eirik Andresen on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "😈"]
    
    var body: some View {
        HStack(content: {
            // the ForEach is saying: give me the view u want for each of theese things
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        })
        .padding()
        .foregroundColor(.orange)
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
