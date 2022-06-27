//
//  BoardViewModel.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import Foundation
import chessthings

// MARK: - 초기값 혹은 states
final class BoardViewModel: ObservableObject {
    
    @Published private var selectedLocation: Location?
    
    var columnCount: Int { board.files.count + 1 }
    var rowCount: Int { board.ranks.count + 1 }
    var gridCount: Int { columnCount * rowCount }
    
    fileprivate let board: Board = Board()
    
}

// MARK: - status
extension BoardViewModel {
    
    var pointForBlack: Int {
        board.point(for: .black)
    }
    
    var pointForWhite: Int {
        board.point(for: .white)
    }
    
    var sideOfCurrentTurn: Side {
        .white
    }
    
    func selectedLocation(column: Int, row: Int) -> Bool {
        guard column > 0, row > 0 else {
            return false
        }
        return self.selectedLocation == Location(file: board.files[column - 1], rank: board.ranks[row - 1])
    }
    
    func availableLocation(column: Int, row: Int) -> Bool {
        guard column > 0, row > 0 else {
            return false
        }
        
        let location = Location(file: board.files[column - 1], rank: board.ranks[row - 1])
        return board.availableLocations(from: selectedLocation).contains(location)
    }
    
    func position(at index: Int) -> (column: Int, row: Int) {
        let column = index % columnCount
        let row = index / rowCount
        return (column, row)
    }
    
    func icon(column: Int, row: Int) -> String {
        if column > 0 && row > 0 {
            return board.icon(at: Location(file: board.files[column - 1], rank: board.ranks[row - 1])).description
        } else if column == 0, row > 0 {
            return board.ranks[row - 1].rawValue.description
        } else if row == 0, column > 0 {
            return board.files[column - 1].rawValue
        } else {
            return " "
        }
    }
}

// MARK: - Action
extension BoardViewModel {
    
    func prepare() {
        board.prepare()
        objectWillChange.send()
    }
    
    func setLocation(column: Int, row: Int) {
        self.selectedLocation = Location(file: board.files[column - 1], rank: board.ranks[row - 1])
        print(board.description(at: self.selectedLocation))
    }
    
}
