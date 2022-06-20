import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    
    func testPawn() {
        for rank in Rank.allCases {
            for file in File.allCases {
                let location = Location(rank: rank, file: file)
                if rank == .two {
                    XCTAssertNotNil(Pawn(.black, location: location))
                    XCTAssertNil(Pawn(.white, location: location))
                } else if rank == .seven {
                    XCTAssertNotNil(Pawn(.white, location: location))
                    XCTAssertNil(Pawn(.black, location: location))
                } else {
                    XCTAssertNil(Pawn(.white, location: location))
                    XCTAssertNil(Pawn(.black, location: location))
                }
            }
        }
    }
    
    func testBoardPrepare() throws {
        let board = Board()
        
        for rank in Rank.allCases {
            for file in File.allCases {
                XCTAssertNil(board.piece(at: Location(rank: rank, file: file)))
            }
        }
        
        board.prepare()
        
        // expect
        for rank in Rank.allCases {
            for file in File.allCases {
                let location = Location(rank: rank, file: file)
                let description = location.description
                let piece = board.piece(at: location)
                if rank == .two {
                    XCTAssertNotNil(piece, description)
                    XCTAssertTrue(piece is Pawn)
                } else if rank == .seven {
                    XCTAssertNotNil(board.piece(at: location), description)
                    XCTAssertTrue(piece is Pawn)
                } else {
                    XCTAssertNil(board.piece(at: location), description)
                }
            }
        }
    }
}
