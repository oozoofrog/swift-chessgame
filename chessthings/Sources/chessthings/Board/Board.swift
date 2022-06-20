
import Foundation

public final class Board {
    
    private(set) var pieces: [Piece] = []
    
    public func prepare() {
        // pawn
        for file in File.allCases {
            if let black = Pawn(.black, location: Location(file: file, rank: .two)) {
                pieces.append(black)
            }
            if let white = Pawn(.white, location: Location(file: file, rank: .seven)) {
                pieces.append(white)
            }
        }
        // bishop
        let blackBishopLocations = [
            Location(file: .C, rank: .one),
            Location(file: .F, rank: .one)
        ]
        let whiteBishopLocations = [
            Location(file: .C, rank: .eight),
            Location(file: .F, rank: .eight)
        ]
        pieces.append(contentsOf: blackBishopLocations.compactMap({ Bishop(.black, location: $0) }))
        pieces.append(contentsOf: whiteBishopLocations.compactMap({ Bishop(.white, location: $0) }))
        
        // luke
        let blackLukeLocations = [
            Location(file: .A, rank: .one),
            Location(file: .H, rank: .one)
        ]
        let whiteLukeLocations = [
            Location(file: .A, rank: .eight),
            Location(file: .H, rank: .eight)
        ]
        pieces.append(contentsOf: blackLukeLocations.compactMap({ Luke(.black, location: $0) }))
        pieces.append(contentsOf: whiteLukeLocations.compactMap({ Luke(.white, location: $0) }))
    }
    
    public func piece(at location: Location) -> Piece? {
        self.pieces.first(where: { $0.location == location })
    }

    func point(for side: Side) -> Int {
        switch side {
        case .black:
            return pieces.filter({ $0.side == .black }).map(\.point).reduce(0, +)
        case .white:
            return pieces.filter({ $0.side == .white }).map(\.point).reduce(0, +)
        }
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
    let file: File
    let rank: Rank
    
    public var description: String {
        "Location.\(file.rawValue)\(rank.rawValue)"
    }
}
