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
        ZStack {
            ForEach(viewModel.cardModels) {
                card in CardView(model: card)
            }
        }
    }
}

#Preview {
    CardStackView()
}
