import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    
    func testBoardPrepare() throws {
        let board = Board()
        
        for rank in Rank.allCases {
            for file in File.allCases {
                XCTAssertNil(board.piece(at: Location(rank: rank, file: file)))
            }
        }
        
        board.prepare()
        
        
        // pawn
        for rank in Rank.allCases {
            for file in File.allCases {
                let location = Location(rank: rank, file: file)
                let description = "pawn \(location.description)"
                let piece = board.piece(at: location)
                if rank == .two {
                    XCTAssertTrue(piece is Pawn, description)
                    XCTAssertEqual(piece?.side, .black, description)
                } else if rank == .seven {
                    XCTAssertTrue(piece is Pawn, description)
                    XCTAssertEqual(piece?.side, .white, description)
                } else {
                    XCTAssertNil(board.piece(at: location), description)
                }
            }
        }
        
        // bishop
        for rank in Rank.allCases {
            for file in File.allCases {
                let location = Location(rank: rank, file: file)
                let description = "bishop \(location.description)"
                let piece = board.piece(at: location)
                if [File.C, .F].contains(file) {
                    switch rank {
                    case .one:
                        XCTAssertTrue(piece is Bishop, description)
                        XCTAssertEqual(piece?.side, .black, description)
                    case .eight:
                        XCTAssertTrue(piece is Bishop, description)
                        XCTAssertEqual(piece?.side, .white, description)
                    default:
                        continue
                    }
                }
            }
        }
    }
}
