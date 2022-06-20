//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public final class Bishop: Piece {
    
    public init?(_ side: Side, location: Location) {
        self.side = side
        switch side {
        case .black:
            guard location.rank == .one, [File.C, .F].contains(location.file) else {
                return nil
            }
        case .white:
            guard location.rank == .eight, [File.C, .F].contains(location.file) else {
                return nil
            }
        }
        self.location = location
    }
    
    public let side: Side
    
    public var point: Int {
        3
    }
    
    public var icon: Character {
        switch side {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
    
    public var location: Location
    
    public func available(location: Location?) -> Bool {
        guard let newLocation = location else {
            return false
        }

        let isDiagonalFile = abs(self.location.file.offset(newLocation.file)) == 1
        switch side {
        case .black:
            let oneRankUp = self.location.rank.offset(newLocation.rank) == 1
            return oneRankUp && isDiagonalFile
        case .white:
            let oneRankDown = self.location.rank.offset(newLocation.rank) == 1
            return oneRankDown && isDiagonalFile
        }
    }
}
