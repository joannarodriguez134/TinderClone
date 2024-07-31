//
//  ImageScrollingOverlay.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    
    var imageCount: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }.foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool) {
        if increment {
            // making sure the increments/decrements stay within bounds
            guard currentImageIndex < imageCount - 1 else { return }
            currentImageIndex += 1
        } else {
            // never get below 0 ( guards are like walls: it  must pass that check in order to continue
            guard currentImageIndex > 0 else { return }
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 2)
}
