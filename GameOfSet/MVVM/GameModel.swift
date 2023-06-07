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
    
    var cardsOnBoard = [Card]()
        
    private(set) var deck: [Card]
            
    private var currentlyChosenCards = [Card]()
    
    //MARK: Game funcs
    
    mutating func selectCard(_ card: Card) {
        // 1. FINDING A CARD ON BOARD
        if let chosenIndex = cardsOnBoard.firstIndex(where: { $0.id == card.id}) {
            // 2. check if card's already selected
            if cardsOnBoard[chosenIndex].isSelected {
                // selection cancelation if needed
                cardsOnBoard[chosenIndex].isSelected = false
                if let cardToRemovefromSelectedArray = currentlyChosenCards.firstIndex(where: { $0.id == card.id}) {
                    currentlyChosenCards.remove(at: cardToRemovefromSelectedArray)
                }
            } else {
                cardsOnBoard[chosenIndex].isSelected = true
                // 3. Counting so far selected cards
                if currentlyChosenCards.count < 3 {
                    currentlyChosenCards.append(card)
                    //  check if selected card make a set when selected 3rd card
                    if currentlyChosenCards.count == 3 {
                        if checkIfSet(currentlyChosenCards) { // Here we need to  highlight cards if they are set
                            for cardToShowAsSet in currentlyChosenCards {
                                if let indexToShowAsSet = cardsOnBoard.firstIndex(where: { $0.id == cardToShowAsSet.id}) {
                                    cardsOnBoard[indexToShowAsSet].isSet = true
                                }
                            }
                        }
                    }
                    // 4. Actions when 4th card being selected
                } else if currentlyChosenCards.count == 3 {
                    //4.1 Removing SET cards
                    if checkIfSet(currentlyChosenCards) {
                        for cardToRemove in currentlyChosenCards {
                            cardsOnBoard.removeAll { card in
                                cardToRemove.id == card.id
                            }
                        }
                        // 4.2 Deselecting , removing cards from selected array, if they don't make a set
                    } else {
                        for cardToDeselect in currentlyChosenCards {
                            if let indexToDeselectCards = cardsOnBoard.firstIndex(where: { $0.id == cardToDeselect.id}) {
                                cardsOnBoard[indexToDeselectCards].isSelected = false
                            }
                        }
                    }
                    currentlyChosenCards.removeAll()
                    // 4.3 appending a new card 
                    currentlyChosenCards.append(card)
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
    
    private func checkIfSet(_ cards: [Card]) -> Bool {
        if ((cards[0].color == cards[1].color && cards[1].color == cards[2].color)
        || (cards[0].color != cards[1].color && cards[1].color != cards[2].color && cards[0].color != cards[2].color)) {
            if ((cards[0].shape == cards[1].shape && cards[1].shape == cards[2].shape)
            || (cards[0].shape != cards[1].shape && cards[1].shape != cards[2].shape && cards[0].shape != cards[2].shape)) {
                if ((cards[0].shading == cards[1].shading && cards[1].shading == cards[2].shading)
                || (cards[0].shading != cards[1].shading && cards[1].shading != cards[2].shading && cards[0].shading != cards[2].shading)) {
                    if ((cards[0].number == cards[1].number && cards[1].number == cards[2].number)
                    || (cards[0].number != cards[1].number && cards[1].number != cards[2].number && cards[0].number != cards[2].number)) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    //MARK: Init
    
    init() {
        self.deck = []
        startNewGame()
    }
}



