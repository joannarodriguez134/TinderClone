//
//  CardStackView.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                ForEach(viewModel.cardModels) {
                    card in CardView(viewModel: viewModel, model: card)
                    
                }
            }
            if !viewModel.cardModels.isEmpty {
                SwipeActionButtonsView(viewModel: viewModel)
            }
        }
 
    }
}

#Preview {
    CardStackView()
}
