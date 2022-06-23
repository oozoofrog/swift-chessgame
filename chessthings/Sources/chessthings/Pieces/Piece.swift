//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public protocol Piece: CustomStringConvertible {
    init(_ side: Side)
    
    var uuid: UUID { get }
    
    var side: Side { get }
    var point: Int { get }
    var icon: Character { get }
    
    func available(to: Location?, from: Location?) -> Bool
    
    func isEqual(_ other: Piece) -> Bool
}

extension Piece {
    
    public func isEqual(_ other: Piece) -> Bool {
        uuid == other.uuid
    }
    
    public func availableLocations(_ locations: [Location], from: Location?) -> [Location] {
        locations.filter({ self.available(to: $0, from: from) })
    }
    
    public var description: String {
        "\(side.rawValue) \(type(of: self))"
    }
}
