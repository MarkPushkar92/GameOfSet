//
//  GameModel.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import Foundation

struct GameModel {
    
    typealias ColorType = Card.ColorType
    typealias Number = Card.Number
    typealias ShapeType = Card.ShapeType
    typealias Shading = Card.Shading
    
    //MARK: Properites
        
    private(set) var deck: [Card]
        
    var cardsOnBoard = [Card]()
    
//    var setCards = [Card]()

    private var currentlyChosenCards = [Card]()
    
    //MARK: Game funcs
    
    private func checkIfSet(_ cards: [Card]) -> Bool {
        if ((cards[0].color == cards[1].color && cards[1].color == cards[2].color)
                    || (cards[0].color != cards[1].color && cards[1].color != cards[2].color && cards[0].color != cards[2].color)
                ) {
                    if ((cards[0].shape == cards[1].shape && cards[1].shape == cards[2].shape)
                        || (cards[0].shape != cards[1].shape && cards[1].shape != cards[2].shape && cards[0].shape != cards[2].shape)
                    ) {
                        if ((cards[0].shading == cards[1].shading && cards[1].shading == cards[2].shading)
                            || (cards[0].shading != cards[1].shading && cards[1].shading != cards[2].shading && cards[0].shading != cards[2].shading)
                        ) {
                            if ((cards[0].number == cards[1].number && cards[1].number == cards[2].number)
                                || (cards[0].number != cards[1].number && cards[1].number != cards[2].number && cards[0].number != cards[2].number)
                            ) {
                                return true
                            }
                        }
                    }
                }
                return false
        
    }
    
    mutating func selectCard(_ card: Card) {
        let card = card
        // check if card's already selected
        if currentlyChosenCards.contains(card) {
            print("card already selected")
            return
        } else {
            if currentlyChosenCards.count < 3 {
                currentlyChosenCards.append(card)
                if currentlyChosenCards.count == 3 {
                    print(checkIfSet(currentlyChosenCards))
                    if checkIfSet(currentlyChosenCards) {
                        for cardToRemove in currentlyChosenCards {
                            cardsOnBoard.removeAll { card in
                                cardToRemove.id == card.id
                            }
                        }
                    }
                    currentlyChosenCards.removeAll()
                }
            }
        }
        
     
    }
    





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
                        let card = Card(id: count, shape: shepe, color: color, number: number, shading: shading)
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

