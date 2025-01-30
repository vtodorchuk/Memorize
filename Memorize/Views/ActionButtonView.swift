//
//  ActiobButtonView.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 24.12.2024.
//

import SwiftUI

struct ActionButtonView: View {
    @ObservedObject var viewModel: MemorizeViewModal
    var theme: Theme
    var systemName: String
    
    var body: some View {
        Button {
            withAnimation {
                viewModel.changeTheme(theme)
            }
        } label: {
            let base = RoundedRectangle(cornerRadius: 12)
            
            base
                .stroke(lineWidth: 2)
                .frame(width: 120, height: 40)
                .overlay {
                    HStack {
                        Image(systemName: systemName)
                        Text(theme.rawValue)
                    }
                    .foregroundStyle(viewModel.selectedTheme == theme ? .white : .blue)
                }
                .background {
                    base.fill(viewModel.selectedTheme == theme ? .blue : .white)
                }
            
        }
    }
}

#Preview {
    ActionButtonView(viewModel: MemorizeViewModal(), theme: .animals, systemName: "hare.fill")
}
