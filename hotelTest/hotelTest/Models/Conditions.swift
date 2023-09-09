//
//  Conditions.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 03/09/23.
//

import Foundation

struct Conditions: Decodable, Hashable {
    var id = UUID()
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
    }
}

var conditionsList = [
    Conditions(name: "Удобства", image: "emoji-happy"),
    Conditions(name: "Что включено", image: "tick-square"),
    Conditions(name: "Что не включено", image: "close-square"),
]
