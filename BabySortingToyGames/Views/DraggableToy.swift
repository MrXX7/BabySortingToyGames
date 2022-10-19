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
    
    var body: some View {
        Circle()
            .fill(toy.color)
            .frame(width: size, height: size)
            .shadow(radius: 10)
            .position(position)
            .gesture(gesture)
    }
}

struct DraggableToy_Previews: PreviewProvider {
    static var previews: some View {
        DraggableToy(
            toy: Toy.all.first!,
            position: .zero,
            gesture: DragGesture())
    }
}
