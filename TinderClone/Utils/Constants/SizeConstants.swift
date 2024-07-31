//
//  SizeConstants.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import Foundation
import SwiftUI

struct SizeConstants {
   static var screenCutOff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
