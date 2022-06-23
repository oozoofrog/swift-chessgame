//
//  Location.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

public struct Location: Hashable, CustomStringConvertible {
    
    public init?(string: String) {
        guard string.count == 2 else {
            return nil
        }
        guard let first = string.first?.description, let file = File(rawValue: first) else {
            return nil
        }
        guard let last = string.last?.description, let number = Int(last) else {
            return nil
        }
        guard let rank = Rank(rawValue: number) else {
            return nil
        }
        self.file = file
        self.rank = rank
    }
    
    public init(file: File, rank: Rank) {
        self.file = file
        self.rank = rank
    }
    
    let file: File
    let rank: Rank
    
    public var description: String {
        "Location.\(file.rawValue)\(rank.rawValue)"
    }
}

public extension Location {
    static let A1 = Location(file: .A, rank: .one)
    static let A2 = Location(file: .A, rank: .two)
    static let A3 = Location(file: .A, rank: .three)
    static let A4 = Location(file: .A, rank: .four)
    static let A5 = Location(file: .A, rank: .five)
    static let A6 = Location(file: .A, rank: .six)
    static let A7 = Location(file: .A, rank: .seven)
    static let A8 = Location(file: .A, rank: .eight)
    static let B1 = Location(file: .B, rank: .one)
    static let B2 = Location(file: .B, rank: .two)
    static let B3 = Location(file: .B, rank: .three)
    static let B4 = Location(file: .B, rank: .four)
    static let B5 = Location(file: .B, rank: .five)
    static let B6 = Location(file: .B, rank: .six)
    static let B7 = Location(file: .B, rank: .seven)
    static let B8 = Location(file: .B, rank: .eight)
    static let C1 = Location(file: .C, rank: .one)
    static let C2 = Location(file: .C, rank: .two)
    static let C3 = Location(file: .C, rank: .three)
    static let C4 = Location(file: .C, rank: .four)
    static let C5 = Location(file: .C, rank: .five)
    static let C6 = Location(file: .C, rank: .six)
    static let C7 = Location(file: .C, rank: .seven)
    static let C8 = Location(file: .C, rank: .eight)
    static let D1 = Location(file: .D, rank: .one)
    static let D2 = Location(file: .D, rank: .two)
    static let D3 = Location(file: .D, rank: .three)
    static let D4 = Location(file: .D, rank: .four)
    static let D5 = Location(file: .D, rank: .five)
    static let D6 = Location(file: .D, rank: .six)
    static let D7 = Location(file: .D, rank: .seven)
    static let D8 = Location(file: .D, rank: .eight)
    static let E1 = Location(file: .E, rank: .one)
    static let E2 = Location(file: .E, rank: .two)
    static let E3 = Location(file: .E, rank: .three)
    static let E4 = Location(file: .E, rank: .four)
    static let E5 = Location(file: .E, rank: .five)
    static let E6 = Location(file: .E, rank: .six)
    static let E7 = Location(file: .E, rank: .seven)
    static let E8 = Location(file: .E, rank: .eight)
    static let F1 = Location(file: .F, rank: .one)
    static let F2 = Location(file: .F, rank: .two)
    static let F3 = Location(file: .F, rank: .three)
    static let F4 = Location(file: .F, rank: .four)
    static let F5 = Location(file: .F, rank: .five)
    static let F6 = Location(file: .F, rank: .six)
    static let F7 = Location(file: .F, rank: .seven)
    static let F8 = Location(file: .F, rank: .eight)
}

public enum File: String, CaseIterable, Hashable {
    case A, B, C, D, E, F, G, H
    
    func offset(_ file: File) -> Int {
        let current = Int(rawValue.first?.asciiValue ?? 0)
        let other = Int(file.rawValue.first?.asciiValue ?? 0)
        return other - current
    }
}

public enum Rank: Int, CaseIterable, Hashable, Comparable {
    public static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    func next(_ offset: Int) -> Rank? {
        Rank(rawValue: rawValue + offset)
    }
    
    func offset(_ rank: Rank) -> Int {
        rank.rawValue - rawValue
    }
}
