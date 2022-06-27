//
//  BoardViewModel.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import Foundation
import chessthings

final class BoardViewModel: ObservableObject {
    
    func prepare() {
        board.prepare()
        objectWillChange.send()
    }
    
    func setPosition(column: Int, row: Int) {
        guard column > 0, row > 0 else {
            return
        }
        self.selectedPosition = Position(column: column, row: row)
    }
    
    func selectedPosition(column: Int, row: Int) -> Bool {
        guard let currentPosition = self.selectedPosition else {
            return false
        }
        return currentPosition.column == column && currentPosition.row == row
    }
    
    let fileCount: Int
    let rankCount: Int
    
    @Published private var selectedPosition: Position?
    
    func icon(column: Int, row: Int) -> String {
        if column > 0 && row > 0 {
            return board.icon(at: Location(file: board.files[row - 1], rank: board.ranks[column - 1])).description
        } else if column == 0, row > 0 {
            return board.files[row - 1].rawValue
        } else if row == 0, column > 0 {
            return board.ranks[column - 1].rawValue.description
        } else {
            return " "
        }
    }
    
    init() {
        self.board = Board()
        self.fileCount = board.files.count + 1
        self.rankCount = board.ranks.count + 1
    }
    
    private let board: Board
    
    struct Position {
        let column: Int
        let row: Int
    }
}
