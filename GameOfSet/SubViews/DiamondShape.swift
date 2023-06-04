//
//  DiamondShape.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 04.06.2023.
//

import SwiftUI

struct DiamondShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let height = rect.width / 4
        let width = rect.width / 2
        let top = CGPoint ( x: center.x, y: center.y + height)
        let righTCoorner = CGPoint ( x: center.x + width, y: center.y)
        let bottom = CGPoint ( x: center.x, y: center.y - height)
        let leftCorner = CGPoint ( x: center.x - width, y: center.y)

        var p = Path()
        p.move(to: top)
        p.addLine(to: righTCoorner)
        p.addLine(to: bottom)
        p.addLine(to: leftCorner)
        p.addLine(to: top)
        return p
    }
    
    
}
