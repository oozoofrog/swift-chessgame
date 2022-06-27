import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    
    var board: Board!
    
    let prepared = PreparedLocations()
    
    override func setUp() {
        board = Board()
        
        board.prepare()
    }
    
    var locations: [Location] {
        prepared.locations
    }
    
    func testBoardBeforePrepare() {
        let board = Board()
        for location in locations {
            XCTAssertNil(board.piece(at: location), location.description)
        }
    }
    
    func testBoardPreparePawn() {
        // black pawn은 모두 rank 2
        for location in prepared.blackPawns {
            let pawn = board.piece(at: location) as? Pawn
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        
        // white pawn은 모두 rank 7
        for location in prepared.whitePawns {
            let pawn = board.piece(at: location) as? Pawn
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
    }
    
    func testBoardPrepareBishop() {
        // black bishop C1, F1
        for location in prepared.blackBishops {
            let pawn = board.piece(at: location) as? Bishop
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        
        // white bishop C8, F8
        for location in prepared.whiteBishops {
            let pawn = board.piece(at: location) as? Bishop
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
    }
    
    func testBoardPrepareLuke() {
        for location in prepared.blackLukes {
            let pawn = board.piece(at: location) as? Rook
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        
        for location in prepared.whiteLukes {
            let pawn = board.piece(at: location) as? Rook
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
    }
    
    func testBoardEmpty() {
        for location in prepared.empties {
            XCTAssertNil(board.piece(at: location), location.description)
        }
    }
    
}

struct PreparedLocations {
    let locations: [Location] = {
        var locations: [Location] = []
        for file in File.allCases {
            for rank in Rank.allCases {
                locations.append(Location(file: file, rank: rank))
            }
        }
        return locations
    }()
    
    var empties: [Location] {
        var empties = self.locations
        empties.removeAll(where: blackPawns.contains)
        empties.removeAll(where: whitePawns.contains)
        empties.removeAll(where: blackBishops.contains)
        empties.removeAll(where: whiteBishops.contains)
        empties.removeAll(where: blackLukes.contains)
        empties.removeAll(where: whiteLukes.contains)
        return empties
    }
    
    let blackPawns = File.allCases.map({ Location(file: $0, rank: .two) })
    let whitePawns = File.allCases.map({ Location(file: $0, rank: .seven) })
    
    let blackBishops = [Location(file: .C, rank: .one), .init(file: .F, rank: .one)]
    let whiteBishops = [Location(file: .C, rank: .eight), .init(file: .F, rank: .eight)]
    
    let blackLukes = [Location(file: .A, rank: .one), .init(file: .H, rank: .one)]
    let whiteLukes = [Location(file: .A, rank: .eight), .init(file: .H, rank: .eight)]
}
