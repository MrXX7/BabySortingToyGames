//
//  Toy.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 19.10.2022.
//

import SwiftUI

struct Toy {
    let id: Int
    let color: Color
}

extension Toy {
    static let all = [
        Toy(id: 1, color: .red),
        Toy(id: 2, color: .green),
        Toy(id: 3, color: .blue),
        Toy(id: 4, color: .orange),
        Toy(id: 5, color: .black),
        Toy(id: 6, color: .purple)
    ]
}
