//
//  ContentView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 23.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State var emojies = ["🐶", "🐶", "🐱", "🐱", "🐭", "🐭", "🐹", "🐹", "🐰", "🐰", "🦊", "🦊", "🐻", "🐻", "🐼", "🐼"]
    
    var body: some View {
        VStack {
           Text("Memorize Game")
                .font(.title)
                .bold()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 240))]) {
                    ForEach(emojies.indices, id: \.self) { index in
                        CardView(symbol: emojies[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            HStack(spacing: 25) {
                animalsButton
                sportsButton
                carsView
            }
        }
        .padding()
        .onAppear() {
            emojies.shuffle()
        }
    }
    
    var animalsButton: some View {
        Button("Animals") { emojies = ["🐶", "🐶", "🐱", "🐱", "🐭", "🐭", "🐹", "🐹", "🐰", "🐰", "🦊", "🦊", "🐻", "🐻", "🐼", "🐼"].shuffled() }
    }
    
    var sportsButton: some View {
        Button("Sports") { emojies = ["⚽️", "⚽️", "🏀", "🏀", "🏈", "🏈", "⚾️", "⚾️", "🥎", "🥎", "🎾", "🎾", "🏐", "🏐", "🏉", "🏉"].shuffled() }
    }
    
    var carsView: some View {
        Button("Cars") { emojies = ["🚗", "🚗", "🚙", "🚙", "🏎️", "🏎️", "🚕", "🚕", "🚓", "🚓", "🚘", "🚘", "🚖", "🚖", "🚔", "🚔"].shuffled() }
    }
}

#Preview {
    ContentView()
}
