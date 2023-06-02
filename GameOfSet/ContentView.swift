//
//  ContentView.swift
//  GameOfSet
//
//  Created by Марк Пушкарь on 02.06.2023.
//

import SwiftUI

struct ContentView: View {
    let viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
