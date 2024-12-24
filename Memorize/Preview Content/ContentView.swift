//
//  ContentView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 23.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
        }
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var symbol = "🙈"
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            base.fill(isFaceUp ? .white : .orange)
            base.stroke(lineWidth: 2).foregroundStyle(.orange)
            
            if isFaceUp { Text(symbol) }
        }
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
