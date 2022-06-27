//
//  ContentView.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import SwiftUI
import chessthings

struct ContentView: View {
    @State var board: String = ""
    var body: some View {
        Text(board)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var board: Board = {
        let board = Board()
        board.prepare()
        return board
    }()
    static var previews: some View {
        ContentView(board: self.board.display())
    }
}
