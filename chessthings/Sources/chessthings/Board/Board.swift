
import Foundation

public final class Board {
    
    private(set) var pieces: [Location: Piece] = [:]
    
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
    
    public func move(to: Location?, from: Location?) -> Bool {
        guard let to = to, let from = from else {
            return false
        }
        
        guard to != from else {
            return false
        }

        guard let piece = self.piece(at: from) else {
            return false
        }
        
        guard availableLocations(from: from).contains(to) else {
            return false
        }
        
        pieces[from] = nil
        pieces[to] = piece
        return true
    }
    
    public func availableLocations(from location: Location?) -> [Location] {
        guard let location = location else {
            return []
        }
        
        guard let piece = self.piece(at: location) else {
            return []
        }
        
        var pieceAvailableLocations = piece.availableLocations(locations(), from: location)
        for location in pieceAvailableLocations {
            if let pieceAtLocation = self.piece(at: location) {
                if pieceAtLocation.side == piece.side {
                    pieceAvailableLocations.removeAll(where: { $0 == location })
                }
            }
        }
        return pieceAvailableLocations
    }
    
    public func prepare() {
        // pawn
        for file in File.allCases {
            pieces[Location(file: file, rank: .two)] = Pawn(.black)
            pieces[Location(file: file, rank: .seven)] = Pawn(.white)
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
        blackBishopLocations.forEach { location in
            pieces[location] = Bishop(.black)
        }
        whiteBishopLocations.forEach { location in
            pieces[location] = Bishop(.white)
        }
        
        // luke
        let blackLukeLocations = [
            Location(file: .A, rank: .one),
            Location(file: .H, rank: .one)
        ]
        let whiteLukeLocations = [
            Location(file: .A, rank: .eight),
            Location(file: .H, rank: .eight)
        ]
        blackLukeLocations.forEach { location in
            pieces[location] = Luke(.black)
        }
        whiteLukeLocations.forEach { location in
            pieces[location] = Luke(.white)
        }
    }
    
    public func piece(at location: Location?) -> Piece? {
        guard let location = location else {
            return nil
        }
        return self.pieces[location]
    }
    
    public func location(of piece: Piece) -> Location? {
        for (locationInDic, pieceInDic) in pieces {
            if piece.isEqual(pieceInDic) {
                return locationInDic
            }
        }
        return nil
    }
    
    private func locations() -> [Location] {
        var locations: [Location] = []
        for file in File.allCases {
            for rank in Rank.allCases {
                locations.append(Location(file: file, rank: rank))
            }
        }
        return locations
    }
    
    public func icon(at location: Location) -> Character {
        return self.piece(at: location)?.icon ?? "."
    }

    public func point(for side: Side) -> Int {
        switch side {
        case .black:
            return pieces.values.filter({ $0.side == .black }).map(\.point).reduce(0, +)
        case .white:
            return pieces.values.filter({ $0.side == .white }).map(\.point).reduce(0, +)
        }
    }
}
