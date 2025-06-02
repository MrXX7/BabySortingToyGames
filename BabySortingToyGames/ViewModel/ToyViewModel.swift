//
//  ToyViewModel.swift
//  BabySortingToyGames
//
//  Created by Oncu Can on 19.10.2022.
//

import SwiftUI

class ToyViewModel: ObservableObject {

    @Published var currentToy: Toy?
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    @Published var draggableToyOpacity: CGFloat = 1.0
    @Published var isGameOver = false
    @Published private(set) var attempts = 0
    @Published private(set) var score = 0
    @Published var showCorrectAnimation = false
    @Published var isDraggingToy = false // New: To indicate if a toy is currently being dragged

    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 100
    )
    private var frames: [Int: CGRect] = [:]

    // MARK: - Objects in the screen
    private var toys = Array(Toy.all.shuffled().prefix(upTo: 3))
    var toyContainers = Toy.all.shuffled()

    // MARK: - Game lifecycle
    func confirmWhereToyWasDropped() {
        defer {
            highlightedId = nil
            isDraggingToy = false // Reset dragging state when drop is confirmed
        }

        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }

        if highlightedId == currentToy?.id {
            setCurrentPositionToHighlightedContainer(WithId: highlightedId)
            incrementScore()
            triggerCorrectAnimation()
            generateNextRound()
        } else {
            resetPosition()
        }

        attempts += 1
    }

    // ... (rest of the ViewModel code remains the same)

    // MARK: - Updates in the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }

    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        for (id, frame) in frames where frame.contains(dragPosition) {
            highlightedId = id
            return
        }

        highlightedId = nil
    }

    func isHighlighted(id: Int) -> Bool {
        highlightedId == id
    }

    // MARK: - Score Management
    private func incrementScore() {
        score += 1
    }

    func getCurrentScore() -> Int {
        return score
    }

    // MARK: - Correct Animation
    private func triggerCorrectAnimation() {
        showCorrectAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showCorrectAnimation = false
        }
    }
}
