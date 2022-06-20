//
//  File.swift
//  
//
//  Created by jaychoi on 2022/06/20.
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
    
    func available(location: Location) -> Bool {
        false
    }
}
