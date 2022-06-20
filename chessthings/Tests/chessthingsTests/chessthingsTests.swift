import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    
    let locations: [Location] = {
        var locations: [Location] = []
        for file in File.allCases {
            for rank in Rank.allCases {
                locations.append(Location(file: file, rank: rank))
            }
        }
        return locations
    }()
    
    func testBoardPrepare() throws {
        
        let board = Board()
    
        XCTAssertTrue(board.pieces.isEmpty)
        
        board.prepare()
        
        var empties = locations
        
        // black pawn은 모두 rank 2
        let blackPawns = File.allCases.map({ Location(file: $0, rank: .two) })
        for location in blackPawns {
            let pawn = board.piece(at: location) as? Pawn
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        empties.removeAll(where: blackPawns.contains)
        
        // white pawn은 모두 rank 7
        let whitePawns = File.allCases.map({ Location(file: $0, rank: .seven) })
        for location in blackPawns {
            let pawn = board.piece(at: location) as? Pawn
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        empties.removeAll(where: whitePawns.contains)
        
        // black bishop C1, F1
        let blackBishops = [Location(file: .C, rank: .one), .init(file: .F, rank: .one)]
        for location in blackBishops {
            let pawn = board.piece(at: location) as? Bishop
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        empties.removeAll(where: blackBishops.contains)
        
        let whiteBishops = [Location(file: .C, rank: .eight), .init(file: .F, rank: .eight)]
        for location in whiteBishops {
            let pawn = board.piece(at: location) as? Bishop
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
        empties.removeAll(where: whiteBishops.contains)
        
        for location in empties {
            XCTAssertNil(board.piece(at: location), location.description)
        }
    }
}
