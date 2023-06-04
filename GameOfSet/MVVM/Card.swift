//
//  Card.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import Foundation


struct Card: Identifiable {
    var isSelected: Bool = false
    var isSet: Bool = false
    var isInTheDeck = true
    let cardContent: CardContent
    let id: Int
}


struct CardContent  {
    
    let shape: ShapeType
    let color: ColorType
    let number: Number
    let shading: Shading
    
    enum Shading: CaseIterable {
        case solid
        case open
        case transparent
    }

    enum ShapeType: CaseIterable {
        case diamond
        case rectangle
        case oval
    }

    enum ColorType: CaseIterable {
        case red
        case green
        case purple
    }

    enum Number: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }

          
}

