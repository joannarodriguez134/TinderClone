//
//  MockData.swift
//  TinderClone
//
//  Created by Joanna Rodriguez on 7/30/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(id: NSUUID().uuidString, fullname: "Peso Pluma", age: 27, profileImageUrls: ["peso-pluma", "peso-pluma-2", "peso-pluma-3"]),
        .init(id: NSUUID().uuidString, fullname: "Rauw Alejandro", age: 22, profileImageUrls: ["rauw", "rauw-2", "rauw-3"]),
        .init(id: NSUUID().uuidString, fullname: "Ferxxo", age: 23, profileImageUrls: ["ferxxo", "ferxxo-2", "ferxxo-3"])
    
    ]
}
