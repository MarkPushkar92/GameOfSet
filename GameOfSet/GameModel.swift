//
//  GameModel.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import Foundation

struct GameModel {
    
    typealias ColorType = CardContent.ColorType
    typealias Number = CardContent.Number
    typealias ShapeType = CardContent.ShapeType
    typealias Shading = CardContent.Shading

    private(set) var deck: [Card]
    
    var setCards = [Card]()
    
    func choose(card: Card) {
        
    }
    
    init() {
        var deck: [Card] = []
        var count = 0
        for color in ColorType.allCases {
            for shepe in ShapeType.allCases {
                for shading in Shading.allCases {
                    for number in Number.allCases {
                        let content = CardContent(shape: shepe, color: color, number: number, shading: shading)
                        let card = Card(cardContent: content, id: 0)
                        deck.append(card)
                        count += 1
                    }
                }
            }
        }
        self.deck = deck.shuffled()
    }
    
    
    private func createCard(color: ColorType, number: Number, shape: ShapeType, shading: Shading, id: Int ) -> Card {
        let cardContent = CardContent(shape: shape, color: color, number: number, shading: shading)
        return Card(cardContent: cardContent, id: id)
    }
    

}

