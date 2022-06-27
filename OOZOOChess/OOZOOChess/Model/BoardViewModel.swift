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
    
    func piece(at location: Location) -> Piece? {
        board.piece(at: location)
    }
    
    func selectedLocation(column: Int, row: Int) -> Bool {
        guard column > 0, row > 0 else {
            return false
        }
        return selected(location: Location(file: board.files[column - 1], rank: board.ranks[row - 1]))
    }
    
    func selected(location: Location?) -> Bool {
        return self.selectedLocation == location
    }
    
    func availableLocation(column: Int, row: Int) -> Bool {
        guard column > 0, row > 0 else {
            return false
        }
        return available(location: Location(file: board.files[column - 1], rank: board.ranks[row - 1]))
    }
    
    func available(location: Location) -> Bool {
        board.availableLocations(from: selectedLocation).contains(location)
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
        self.set(location: Location(file: board.files[column - 1], rank: board.ranks[row - 1]))
    }
    
    func set(location: Location) {
        guard let piece = board.piece(at: location) else {
            return
        }
        guard piece.side == sideOfCurrentTurn else {
            return
        }
        self.selectedLocation = location
    }
    
}
