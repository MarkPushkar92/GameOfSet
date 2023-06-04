//
//  GameViewModel.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import SwiftUI

struct GameViewModel {
    
    var deck: [Card] {
        model.deck
    }
    
    var setCards: [Card]  {
        model.setCards
    }
    var cardsOnBoard: [Card]  {
        model.cardsOnBoard
    }
    
    var model = GameModel()
    
    func choose(card: Card) {
        model.choose(card: card)
        
    }
    
    
    func getColor(card: Card) -> Color {
        switch card.cardContent.color {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
}
