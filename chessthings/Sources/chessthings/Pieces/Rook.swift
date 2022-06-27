//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public final class Rook: Piece {
    
    public let uuid: UUID = UUID()
    
    public init(_ side: Side) {
        self.side = side
    }
    
    public let side: Side
    
    public let point: Int = 5
    
    public var icon: Character {
        switch side {
        case .black:
            return "♜"
        case .white:
            return "♖"
        }
    }
    
    public func available(to: Location?, from: Location?) -> Bool {
        guard let to = to else {
            return false
        }
        if let from = from {
            return false
        } else {
            switch side {
            case .black:
                return to.rank == .one && [File.A, .H].contains(to.file)
            case .white:
                return to.rank == .eight && [File.A, .H].contains(to.file)
            }
        }
    }
}
