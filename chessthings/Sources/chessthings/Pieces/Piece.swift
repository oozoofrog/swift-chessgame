//
//  File.swift
//  
//
//  Created by jaychoi on 2022/06/20.
//

import Foundation

public protocol Piece {
    init(_ side: Side, location: Location)
    
    var side: Side { get }
    var point: Int { get }
    var icon: Character { get }
    
    var location: Location { get }
    
    func move(to location: Location) -> Bool
}
