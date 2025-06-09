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
            // Background color circle remains
            Circle()
                .fill(toy.color)
                .frame(width: regularSize, height: regularSize)
            
            // Image overlay on top of the circle
            Image(toy.imageName) // Use the image name
                .resizable()
                .scaledToFit()
                .frame(width: regularSize * 0.7, height: regularSize * 0.7) // Slightly smaller than container
            
            // Highlighted state with scale and shadow
            if viewModel.isHighlighted(id: toy.id) {
                Circle()
                    .fill(toy.color)
                    .opacity(0.7)
                    .frame(width: highlightedSize, height: highlightedSize)
                    .scaleEffect(1.1)
                    .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 10)
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
        .frame(width: highlightedSize, height: highlightedSize)
        .animation(.spring(), value: viewModel.highlightedId)
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
