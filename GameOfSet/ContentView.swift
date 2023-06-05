//
//  ContentView.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel = GameViewModel()
    var body: some View {
        AspectVGrid(items: viewModel.cardsOnBoard, aspectRatio: 2/3) { card in
            CardView(card: card, color: viewModel.getColor(card: card))
                .padding(4)
        }
        .foregroundColor(.indigo)
        .padding(.horizontal)
        Spacer()
        HStack {
            newGameButton
                .padding(.horizontal)
            Spacer()
            dealButton
                .padding(.horizontal)

        }
    }
    
    private var newGameButton: some View {
        Button("New Game") {
            viewModel.newGame()
        }
    }
    
    private var dealButton: some View {
        Button {
            viewModel.deal()
            print("cards on board: \(viewModel.cardsOnBoard.count)")
            print("cards in the deck: \(viewModel.deck.count)")

        } label: {
            Image(systemName: "plus.circle.fill")
        }
    }
}


struct CardView: View {
    let card: Card
    let color: Color
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        .padding(5).opacity(0.5)
                CardSubView(card: card, color: color, size: geometry.size)
           }
            
        }
    }
    
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
