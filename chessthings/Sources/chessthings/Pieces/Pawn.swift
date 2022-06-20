//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public final class Pawn: Piece {
    
    public init?(_ side: Side, location: Location) {
        self.side = side
        switch side {
        case .black:
            guard location.rank == .two else {
                return nil
            }
        case .white:
            guard location.rank == .seven else {
                return nil
            }
        }
        self.location = location
    }
    
    public let side: Side
    
    public var point: Int {
        1
    }
    
    public var icon: Character {
        switch side {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    public var location: Location
    
    public func available(location: Location?) -> Bool {
        guard let newLocation = location else {
            return false
        }
        guard newLocation.file == self.location.file else {
            return false
        }
        switch side {
        case .black:
            return newLocation.rank.rawValue - self.location.rank.rawValue == 1
        case .white:
            return self.location.rank.rawValue - newLocation.rank.rawValue == 1
        }
    }
}
