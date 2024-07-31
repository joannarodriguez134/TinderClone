//
//  CardModel.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable {
    var id: String { return user.id }
}
