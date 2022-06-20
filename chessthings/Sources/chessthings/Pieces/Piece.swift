//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public protocol Piece: CustomStringConvertible {
    init?(_ side: Side, location: Location)
    
    var side: Side { get }
    var point: Int { get }
    var icon: Character { get }
    
    var location: Location { get set }
    
    func available(location: Location?) -> Bool
    func availableLocations(_ locations: [Location]) -> [Location]
}

extension Piece {
    
    public func availableLocations(_ locations: [Location]) -> [Location] {
        locations.filter(available)
    }
    
    public var description: String {
        "\(side.rawValue) \(type(of: self)).\(location)"
    }
}
