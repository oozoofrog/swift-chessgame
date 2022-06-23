//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public final class Bishop: Piece {
    
    public let uuid: UUID = UUID()
    
    public init(_ side: Side) {
        self.side = side
    }
    
    public let side: Side
    
    public let point: Int = 3
    
    public var icon: Character {
        switch side {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
    
    public func available(to: Location?, from: Location? = nil) -> Bool {
        guard let to = to else {
            return false
        }
        if let from = from {
            let isDiagonalFile = abs(from.file.offset(to.file)) == 1
            switch side {
            case .black:
                let oneRankUp = from.rank.offset(to.rank) == 1
                return oneRankUp && isDiagonalFile
            case .white:
                let oneRankDown = from.rank.offset(to.rank) == 1
                return oneRankDown && isDiagonalFile
            }
        } else  {
            switch side {
            case .black:
                return to.rank == .one && [File.C, .F].contains(to.file)
            case .white:
                return to.rank == .eight && [File.C, .F].contains(to.file)
            }
        }
    }
    
}
