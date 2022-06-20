
import Foundation

public final class Board {
    
    private(set) var pieces: [Piece] = []
    
    public func display() -> String {
        var displays: [String] = [" \(File.allCases.map(\.rawValue).joined())"]
        for rank in Rank.allCases {
            var display = rank.rawValue.description
            for file in File.allCases {
                let location = Location(file: file, rank: rank)
                display.append(icon(at: location))
            }
            displays.append(display)
        }
        displays.append(" \(File.allCases.map(\.rawValue).joined())")
        return displays.joined(separator: "\n")
    }
    
    public func availableLocation(from location: Location?) -> Location? {
        guard let location = location else {
            return nil
        }

        if let pawn = piece(at: location) as? Pawn {
            switch pawn.side {
            case .black:
                guard let nextRank = pawn.location.rank.next(1) else {
                    return nil
                }
                let nextLocation = Location(file: location.file, rank: nextRank)
                return nextLocation
            case .white:
                guard let nextRank = pawn.location.rank.next(-1) else {
                    return nil
                }
                let nextLocation = Location(file: location.file, rank: nextRank)
                return nextLocation
            }
        }
        return nil
    }
    
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
    
    public func icon(at location: Location) -> Character {
        return self.piece(at: location)?.icon ?? "."
    }

    public func point(for side: Side) -> Int {
        switch side {
        case .black:
            return pieces.filter({ $0.side == .black }).map(\.point).reduce(0, +)
        case .white:
            return pieces.filter({ $0.side == .white }).map(\.point).reduce(0, +)
        }
    }
}
