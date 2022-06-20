//
//  File.swift
//  
//
//  Created by jaychoi on 2022/06/20.
//

import Foundation

public struct Pawn: Hashable {
    
    public init(_ side: Side) {
        switch side {
        case .black:
            self.icon = '♟'
        case .white:
            self.icon = '♙'
        }
    }
    
    let icon: Character
    
    let uuid: UUID = UUID()
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(icon)
        hasher.combine(uuid)
    }
    
}
