//
//  Cardify.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 20.01.2025.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }

    var rotation: Double
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base
                .stroke(lineWidth: 2)
                .foregroundStyle(.blue)
                .overlay(content)
                .background(base.fill(isFaceUp ? .white : .blue))
                .opacity(isFaceUp ? 1 : 0)
     
            base.fill(.blue).opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}

