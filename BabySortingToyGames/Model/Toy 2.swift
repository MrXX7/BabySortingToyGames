//
//  Toy 2.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 9.06.2025.
//


import SwiftUI

struct Toy: Identifiable, Equatable { // Add Equatable for easier comparison if needed later
    let id: Int
    let color: Color
    let imageName: String // New: Name of the image asset
}

extension Toy {
    static let all = [
        Toy(id: 1, color: .red, imageName: "red_car"),    // Match with your asset names
        Toy(id: 2, color: .blue, imageName: "blue_ball"),
        Toy(id: 3, color: .green, imageName: "green_block"),
        Toy(id: 4, color: .black, imageName: "black_train"),
        Toy(id: 5, color: .orange, imageName: "orange_star"),
        Toy(id: 6, color: .purple, imageName: "purple_duck")
    ]
}