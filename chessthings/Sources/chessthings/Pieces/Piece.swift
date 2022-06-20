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
}

extension Piece {
    public var description: String {
        "\(side.rawValue) \(type(of: self)).\(location)"
    }
}
