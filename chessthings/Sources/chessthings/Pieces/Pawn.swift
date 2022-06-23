//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public final class Pawn: Piece {
    
    public let uuid: UUID = UUID()
    
    public init(_ side: Side) {
        self.side = side
    }
    
    public let side: Side
    
    public let point: Int = 1
    
    public var icon: Character {
        switch side {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    public func available(to: Location?, from: Location?) -> Bool {
        guard let to = to else {
            return false
        }
        if let from = from {
            guard to.file == from.file else {
                return false
            }
            switch side {
            case .black:
                return to.rank.rawValue - from.rank.rawValue == 1
            case .white:
                return from.rank.rawValue - to.rank.rawValue == 1
            }
        } else {
            switch side {
            case .black:
                return to.rank == .two
            case .white:
                return to.rank == .seven
            }
        }
    }

}
