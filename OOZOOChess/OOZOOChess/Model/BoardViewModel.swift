//
//  BoardViewModel.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import Foundation
import chessthings

final class BoardViewModel: ObservableObject {
    
    private let board = Board()
    
    var display: String { board.display().replacingOccurrences(of: ".", with: " ") }
    
    func prepare() {
        board.prepare()
        objectWillChange.send()
    }
    
}
