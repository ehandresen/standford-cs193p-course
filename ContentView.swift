//
//  ContentView.swift
//  card-game
//
//  Created by Eirik Andresen on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
            CardView()
        })
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    // all structs with a var need a value
    @State var isFaceUp = false
    
    var body: some View {
        ZStack { // called trailing closure syntax
            
            // let = constant
            // RoundedRectangle is infered as the type
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
