//
//  ContentView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 23.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State var emojies = ["🐶", "🐶", "🐱", "🐱", "🐭", "🐭", "🐹", "🐹", "🐰", "🐰", "🦊", "🦊", "🐻", "🐻", "🐼", "🐼"]
    @State var selectedTheme = "animals"
    
    var body: some View {
        VStack {
           Text("Memorize!")
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
            
            HStack {
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
        Button {
            emojies = ["🐶", "🐶", "🐱", "🐱", "🐭", "🐭", "🐹", "🐹", "🐰", "🐰", "🦊", "🦊", "🐻", "🐻", "🐼", "🐼"].shuffled()
            selectedTheme = "animals"
        } label: {
            let base = RoundedRectangle(cornerRadius: 12)
            
            base
                .stroke(lineWidth: 2)
                .frame(width: 120, height: 40)
                .overlay {
                    HStack {
                        Image(systemName: "hare.fill")
                        Text("Animals")
                    }
                    .foregroundStyle(selectedTheme == "animals" ? .white : .blue)
                }
                .background {
                    base.fill(selectedTheme == "animals" ? .blue : .white)
                }
            
        }
    }
    
    var sportsButton: some View {
        Button {
            emojies = ["⚽️", "⚽️", "🏀", "🏀", "🏈", "🏈", "⚾️", "⚾️", "🥎", "🥎", "🎾", "🎾", "🏐", "🏐", "🏉", "🏉"].shuffled()
            selectedTheme = "sports"
        } label: {
            let base = RoundedRectangle(cornerRadius: 12)
            
            base
                .stroke(lineWidth: 2)
                .frame(width: 120, height: 40)
                .overlay {
                    HStack {
                        Image(systemName: "figure.run")
                        Text("Sports")
                    }
                    .foregroundStyle(selectedTheme == "sports" ? .white : .blue)
                }
                .background {
                    base.fill(selectedTheme == "sports" ? .blue : .white)
                }
        }
    }
    
    var carsView: some View {
        Button {
            emojies = ["🚗", "🚗", "🚙", "🚙", "🏎️", "🏎️", "🚕", "🚕", "🚓", "🚓", "🚘", "🚘", "🚖", "🚖", "🚔", "🚔"].shuffled()
            selectedTheme = "cars"
        } label: {
            let base = RoundedRectangle(cornerRadius: 12)
            
            base
                .stroke(lineWidth: 2)
                .frame(width: 120, height: 40)
                .overlay {
                    HStack {
                        Image(systemName: "car.rear.fill")
                        Text("Cars")
                    }
                    .foregroundStyle(selectedTheme == "cars" ? .white : .blue)
                }
                .background {
                    base.fill(selectedTheme == "cars" ? .blue : .white)
                }
        }
    }
}

#Preview {
    ContentView()
}
