//
//  GameViewModel.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import Foundation

struct GameViewModel {
    
    var deck: [Card] {
        model.deck
    }
    
    let model = GameModel()
    
    func choose(card: Card) {
        model.choose(card: card)
        
    }
}
