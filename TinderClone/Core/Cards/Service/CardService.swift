//
//  CardService.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({ CardModel(user: $0) })
    }
}
