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
                card in CardView(viewModel: viewModel, model: card)
                
            }
        }
        .onChange(of: viewModel.cardModels) { oldValue, newValue in
            print("DEBUG: old value count is \(oldValue.count)")
            print("DEBUG: new value count is \(newValue.count)")
        }
    }
}

#Preview {
    CardStackView()
}
