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

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
