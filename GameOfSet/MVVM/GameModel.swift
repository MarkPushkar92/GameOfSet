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
    
    //MARK: Properites
        
    private(set) var deck: [Card]
        
    var cardsOnBoard = [Card]()
    
//    var setCards = [Card]()
//
//    var currentlyChosenCards = [Card]()
    
    //MARK: Game funcs
        
    mutating func dealThreeMore() {
        for _ in 0...2 {
            if let card = deck.first {
                cardsOnBoard.append(card)
                deck.removeFirst()
            }
        }
    }
    
    mutating func startNewGame() {
        
        deck = []
        var count = 0
        
        for color in ColorType.allCases {
            for shepe in ShapeType.allCases {
                for shading in Shading.allCases {
                    for number in Number.allCases {
                        let content = CardContent(shape: shepe, color: color, number: number, shading: shading)
                        let card = Card(cardContent: content, id: count)
                        deck.append(card)
                        count += 1
                    }
                }
            }
        }
        cardsOnBoard = []
        deck.shuffle()
        for _ in 0...11 {
            if let card = deck.first {
                cardsOnBoard.append(card)
                deck.removeFirst()
            }
        }
    }
    
    //MARK: Init
    
    init() {

        self.deck = []
        startNewGame()
    }
}

