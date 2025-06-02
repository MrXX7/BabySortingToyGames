//
//  ToyContainer.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 19.10.2022.
//

import SwiftUI

struct ToyContainer: View {
    let toy: Toy
    
    @ObservedObject var viewModel: ToyViewModel
    private let regularSize: CGFloat = 100
    private let highlightedSize: CGFloat = 130
    
    var body: some View {
        ZStack {
            Circle()
                .fill(toy.color)
                .frame(width: regularSize, height: regularSize)
            
            // Highlighted state with scale and shadow
            if viewModel.isHighlighted(id: toy.id) {
                Circle()
                    .fill(toy.color)
                    .opacity(0.7) // Slightly less opaque to show underlying circle
                    .frame(width: highlightedSize, height: highlightedSize)
                    .scaleEffect(1.1) // Slightly scale up when highlighted
                    .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 10) // More pronounced shadow
            }
        }
        .overlay {
            GeometryReader { proxy -> Color in
                viewModel.update(
                    frame: proxy.frame(in: .global),
                    for: toy.id
                )
                
                return Color.clear
            }
        }
        .frame(width: highlightedSize, height: highlightedSize) // Ensure enough space for highlighted state
        .animation(.spring(), value: viewModel.highlightedId) // Add animation for highlight state changes
    }
}

struct ToyContainer_Previews: PreviewProvider {
    static var previews: some View {
        ToyContainer(
            toy: Toy.all.first!,
            viewModel: ToyViewModel()
        )
    }
}
