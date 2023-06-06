//
//  GameViewModel.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import SwiftUI

struct GameViewModel {
    
    //MARK: Properties

    var deck: [Card] {
        model.deck
    }
    
    var cardsOnBoard: [Card]  {
        model.cardsOnBoard
    }
    
    private var model = GameModel()
    
    //MARK: Game funcs
    
    mutating func selectCard(_ card: Card) {
        model.selectCard(card)
    }

    mutating func deal() {
        model.dealThreeMore()
    }
    
    mutating func newGame() {
        model.startNewGame()
    }
    
    func getColor(card: Card) -> Color {
        switch card.color {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
}
