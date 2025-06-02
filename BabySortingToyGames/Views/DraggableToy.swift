//
//  DraggableToy.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 19.10.2022.
//

import SwiftUI

struct DraggableToy<Draggable: Gesture>: View {
    let toy: Toy
    private let size: CGFloat = 100
    let position: CGPoint
    let gesture: Draggable
    let isDragging: Bool // New: To know if the toy is being dragged
    
    var body: some View {
        Circle()
            .fill(toy.color)
            .frame(width: size, height: size)
            // Apply scale and shadow based on isDragging
            .scaleEffect(isDragging ? 1.1 : 1.0) // Scale up slightly when dragging
            .shadow(radius: isDragging ? 15 : 10) // More shadow when dragging
            .position(position)
            .gesture(gesture)
            .animation(.interactiveSpring(), value: isDragging) // Animate the scale and shadow changes
    }
}

struct DraggableToy_Previews: PreviewProvider {
    static var previews: some View {
        DraggableToy(
            toy: Toy.all.first!,
            position: .zero,
            gesture: DragGesture(),
            isDragging: false // Default for preview
        )
    }
}
