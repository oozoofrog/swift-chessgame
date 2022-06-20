//
//  File.swift
//  
//
//  Created by jaychoi on 2022/06/20.
//

import Foundation

public final class Luke: Piece {
    
    public init?(_ side: Side, location: Location) {
        self.side = side
        switch side {
        case .black:
            guard location.rank == .one, [File.A, .H].contains(location.file) else {
                return nil
            }
        case .white:
            guard location.rank == .eight, [File.A, .H].contains(location.file) else {
                return nil
            }
        }
        self.location = location
    }
    
    public let side: Side
    
    public var point: Int {
        5
    }
    
    public var icon: Character {
        switch side {
        case .black:
            return "♜"
        case .white:
            return "♖"
        }
    }
    
    private(set) public var location: Location
    
    public func move(to location: Location) -> Bool {
        guard self.location.file == location.file else {
            return false
        }
        switch side {
        case .black:
            guard self.location.rank > location.rank else {
                return false
            }
        case .white:
            guard self.location.rank < location.rank else {
                return false
            }
        }
        self.location = location
        return true
    }
    
}
