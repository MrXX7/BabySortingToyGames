//
//  CorrectAnimationView.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 2.06.2025.
//

import SwiftUI

struct CorrectAnimationView: View {
    var body: some View {
        Text("Correct! 🎉")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.green)
            .padding()
            .background(Capsule().fill(Color.white.opacity(0.8)))
            .animation(.easeInOut(duration: 0.5), value: UUID()) // Simple animation
            .shadow(radius: 10)
    }
}

struct CorrectAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectAnimationView()
    }
}
