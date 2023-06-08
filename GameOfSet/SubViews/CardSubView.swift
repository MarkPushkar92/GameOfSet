//
//  CardSubView.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 04.06.2023.
//

import SwiftUI

struct CardSubView: View {
    
    let card: Card
    let color: Color
    let size: CGSize
    
    var body: some View {
        VStack {
            Spacer()
            switch card.number {
            case .one:
                shapeToUse()
            case .two:
                shapeToUse()
                shapeToUse()
            case .three:
                shapeToUse()
                shapeToUse()
                shapeToUse()
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func shapeToUse() -> some View {
        let width = size.width * ShapeConstants.relativeWidthMultiplier
        let height = size.height * ShapeConstants.relativeHeightMultiplier
        
        ZStack {
            let diamondBorder = DiamondShape().stroke(color, lineWidth: ShapeConstants.borderWidth)
            let ovalBorder = Capsule().stroke(color, lineWidth: ShapeConstants.borderWidth)
            let squiggleBorder = Squiggle().stroke(color, lineWidth: ShapeConstants.borderWidth)
            
            let diamond = DiamondShape()
            let oval = Capsule()
            let squiggle = Squiggle()
            
            switch card.shape {
            case .diamond:
                diamondBorder
                shadingToUse(width: width,height: height).mask(diamond)
            case .oval:
                ovalBorder
                shadingToUse(width: width,height: height).mask(oval)
            default:
                squiggleBorder
                shadingToUse(width: width,height: height).mask(squiggle)
            }
        }
        .frame(width: width, height: height)
    }
    
    @ViewBuilder
    private func shadingToUse(width: CGFloat, height: CGFloat) -> some View {
        switch card.shading {
        case .open:
            Color.clear
        case .solid:
            color
        case.transparent:
            color.opacity(0.4)
        }
        
        
    }
    
    private struct ShapeConstants {
        static let relativeWidthMultiplier: CGFloat = 0.65
        static let relativeHeightMultiplier: CGFloat = 0.15
        static let borderWidth: CGFloat = 1
    }
    
}
