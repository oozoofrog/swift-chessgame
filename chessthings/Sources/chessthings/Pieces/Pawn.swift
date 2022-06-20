//
//  File.swift
//  
//
//  Created by jaychoi on 2022/06/20.
//

import Foundation

public struct Pawn: Hashable {
    
    public init(_ side: Side) {
        self.side = side
    }
    
    let side: Side
    let uuid: UUID = UUID()
    
    var icon: Character {
        switch side {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    public func moveableTo(rank: Board.Rank, file: Board.File) -> Bool {
        false
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(icon)
        hasher.combine(side)
        hasher.combine(uuid)
    }
    
}
