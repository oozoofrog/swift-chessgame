//
//  ContentView.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: BoardViewModel
    var body: some View {
        Text(model.display)
            .font(.title3.monospaced())
            .onAppear {
                model.prepare()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: BoardViewModel())
    }
}
