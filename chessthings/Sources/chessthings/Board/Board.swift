
import Foundation

public final class Board {
    
    private var pieces: [Piece] = []
    
    public func prepare() {
        // black&white pawn
        for file in File.allCases {
            pieces.append(Pawn(.black, location: Location(rank: .two, file: file)))
            pieces.append(Pawn(.white, location: Location(rank: .seven, file: file)))
        }
    }
    
    public func piece(at location: Location) -> Piece? {
        self.pieces.first(where: { $0.location == location })
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

public struct Location: Hashable, CustomStringConvertible {
    let rank: Rank
    let file: File
    
    public var description: String {
        "Location.\(file.rawValue)\(rank.rawValue)"
    }
}
