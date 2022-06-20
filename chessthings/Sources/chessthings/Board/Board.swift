
import Foundation

public final class Board {
    
    public func prepare() {
        
    }
    
    public func piece(at location: Location) -> Piece? {
        nil
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
}

public enum File: String, CaseIterable, Hashable {
    case A, B, C, D, E, F, G, H
}

public struct Location: Hashable {
    let rank: Rank
    let file: File
}
