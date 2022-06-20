//
//  Location.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import Foundation

@dynamicMemberLookup
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
    
    static subscript(dynamicMember location: String) -> Location? {
        Location(string: location)
    }
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
