//
//  ContentView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 23.12.2024.
//

import SwiftUI

struct ContentView: View {
    typealias Card = MemorizeGame<String>.Card
    @ObservedObject var viewModel: MemorizeViewModal
    
    private let asAspecRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .bold()
            
            AspectVGrid(items: viewModel.cards, asAspecRatio: asAspecRatio) { card in
                CardView(card: card)
                    .padding(4)
                    .overlay(FlyingNumberView(number: calculateScore(card: card)))
                    .zIndex(calculateScore(card: card) != 0 ? 1 : 0)
                    .onTapGesture {
                        withAnimation {
                            let scoreChangeBefore = viewModel.score
                            viewModel.choose(card)
                            let scoreChange = viewModel.score - scoreChangeBefore
                            lastScoreChange = (scoreChange, causedCardId: card.id)
                        }
                    }
            }
            
            Text("Score: \(viewModel.score)")
            
            HStack {
                ActionButtonView(viewModel: viewModel, theme: .animals, systemName: "hare.fill")
                ActionButtonView(viewModel: viewModel, theme: .sports, systemName: "figure.run")
                ActionButtonView(viewModel: viewModel, theme: .cars, systemName: "car.fill")
            }
        }
        .padding()
        .onAppear() { viewModel.shuffle() }
    }
    
    @State private var lastScoreChange = (0, causedCardId: "")
      
    func calculateScore(card: Card) -> Int {
        let (amount, id) = lastScoreChange
         
        return card.id == id ? amount : 0
    }
}
  
struct FlyingNumberView: View {
    
    @State private var offset: CGFloat = 0
    
    let number: Int
      
    var body: some View {
        if number != 0 {
            Text(number, format: .number.sign(strategy: .always()))
                .font(.largeTitle)
                .foregroundStyle(number < 0 ? .red : .green)
                .shadow(color: .black, radius: 1.5, x: 1, y: 1)
                .offset(x: 0, y: offset)
                .opacity(offset != 0 ? 0 : 1)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        offset = number < 0 ? 200 : -200
                    }
                }
                .onDisappear {
                    offset = 0
                }
        }
    }
}

#Preview {
    ContentView(viewModel: MemorizeViewModal())
}
