//
//  CardView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 24.12.2024.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp = false
    var symbol = "🙈"
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(isFaceUp ? .white : .orange)
                base.stroke(lineWidth: 2).foregroundStyle(.orange)
                Text(symbol)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill(.orange).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
}

#Preview {
    CardView()
}
