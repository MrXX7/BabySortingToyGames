//
//  ToyContainer.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 19.10.2022.
//

import SwiftUI

struct ToyContainer: View {
    @State var position = CGPoint.zero
    
    var body: some View {
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                .overlay {
                    GeometryReader { proxy -> Color in
                        let frame = proxy.frame(in: .global)
                        position = CGPoint(x: frame.midX, y: frame.midY)
                        
                        return Color.clear
                }
        }
    }
}

struct ToyContainer_Previews: PreviewProvider {
    static var previews: some View {
        ToyContainer()
    }
}
