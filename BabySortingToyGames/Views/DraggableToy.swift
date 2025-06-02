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
    let isDragging: Bool // This is correct, it's a simple Bool
    
    var body: some View {
        Circle()
            .fill(toy.color)
            .frame(width: size, height: size)
            .scaleEffect(isDragging ? 1.1 : 1.0)
            .shadow(radius: isDragging ? 15 : 10)
            .position(position)
            .gesture(gesture)
            .animation(.interactiveSpring(), value: isDragging)
    }
}

struct DraggableToy_Previews: PreviewProvider {
    static var previews: some View {
        DraggableToy(
            toy: Toy.all.first!,
            position: .zero,
            gesture: DragGesture(),
            isDragging: false
        )
    }
}
