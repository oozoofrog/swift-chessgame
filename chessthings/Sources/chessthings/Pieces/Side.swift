//
//  File.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public enum Side: String {
    case black = "Black"
    case white = "White"
    
    public mutating func toggle() {
        switch self {
        case .black:
            self = .white
        case .white:
            self = .black
        }
    }
}
