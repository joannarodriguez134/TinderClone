//
//  CardView.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    
    @State private var mockImages = [
        "peso-pluma",
        "peso-pluma-2",
        "peso-pluma-3"
    ]
    let model: CardModel
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top, content: {
                Image(user.profileImageUrls[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffSet: $xOffset)
            })
                
            // passing in user from card model
            UserInfoView(user: user)

        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)

        )
    }
}
private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}

private extension CardView {
    
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
            
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
            
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        
        // making sure that it is performed on topmost card (rather than all cards)
        let topCard = viewModel.cardModels.last
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            returnToCenter()
            return // added bc if it is returned to center it will stop there & akip if else statement
        }
        
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}



#Preview {
    CardView(viewModel: CardsViewModel(service: CardService()), model: CardModel(user: MockData.users[1]))
}
