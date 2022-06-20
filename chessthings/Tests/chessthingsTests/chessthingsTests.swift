import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    
    var board: Board!
    
    override func setUp() {
        board = Board()
        
        board.prepare()
    }
    
    let locations: [Location] = {
        var locations: [Location] = []
        for file in File.allCases {
            for rank in Rank.allCases {
                locations.append(Location(file: file, rank: rank))
            }
        }
        return locations
    }()
    
    func testBoardBeforePrepare() {
        let board = Board()
        for location in locations {
            XCTAssertNil(board.piece(at: location), location.description)
        }
    }
    
    func testBoardPreparePawn() {
        // black pawn은 모두 rank 2
        let blackPawns = File.allCases.map({ Location(file: $0, rank: .two) })
        for location in blackPawns {
            let pawn = board.piece(at: location) as? Pawn
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        
        // white pawn은 모두 rank 7
        let whitePawns = File.allCases.map({ Location(file: $0, rank: .seven) })
        for location in whitePawns {
            let pawn = board.piece(at: location) as? Pawn
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
    }
    
    func testBoardPrepareBishop() {
        // black bishop C1, F1
        let blackBishops = [Location(file: .C, rank: .one), .init(file: .F, rank: .one)]
        for location in blackBishops {
            let pawn = board.piece(at: location) as? Bishop
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        
        // white bishop C8, F8
        let whiteBishops = [Location(file: .C, rank: .eight), .init(file: .F, rank: .eight)]
        for location in whiteBishops {
            let pawn = board.piece(at: location) as? Bishop
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
    }
    
    func testBoardPrepareLuke() {
        let blackLukes = [Location(file: .A, rank: .one), .init(file: .H, rank: .one)]
        for location in blackLukes {
            let pawn = board.piece(at: location) as? Luke
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .black, description)
        }
        
        let whiteLukes = [Location(file: .A, rank: .eight), .init(file: .H, rank: .eight)]
        for location in whiteLukes {
            let pawn = board.piece(at: location) as? Luke
            let description = pawn?.description ?? "Empty.\(location)"
            XCTAssertEqual(pawn?.side, .white, description)
        }
    }
    
}
