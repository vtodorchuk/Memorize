//
//  CardView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 24.12.2024.
//

import SwiftUI

struct CardView: View {
    var card: MemorizeGame<String>.Card
    
    var body: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining *  360))
                    .fill(.blue)
                    .opacity(0.5)
                    .overlay(cardContent.padding(5))
                    .padding(5)
                    .cardify(isFaceUp: card.isFaceUp)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContent: some View {
        Text(card.content)
            .font(.system(size: 200))
            .minimumScaleFactor(0.01)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.easeInOut(duration: 2), value: card.isMatched)
    }
}

#Preview {
    CardView(card: MemorizeGame<String>.Card(isFaceUp: true, isMatched: false, content: "⚡️", id: "1a"))
}
