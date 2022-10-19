//
//  BabyToyView.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 19.10.2022.
//

import SwiftUI

struct BabyToyView: View {
    let currentToy = Toy(id: 1, color: .red)
    @State var position = CGPoint(x: 100, y: 100)
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                position = state.location
            }
            .onEnded { state in
                position = CGPoint(x: 100, y: 100)
            }
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(0..<6, id: \.self) { _ in
                    Circle()
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                }
            }
            DraggableToy(toy: currentToy,
                         position: position,
                         gesture: drag
            )
        }
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
