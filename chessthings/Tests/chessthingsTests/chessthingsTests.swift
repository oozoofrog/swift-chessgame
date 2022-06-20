import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    func testBoard() throws {
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
                if rank == .two {
                    XCTAssertNotNil(board.piece(at: location))
                } else if rank == .seven {
                    XCTAssertNotNil(board.piece(at: location))
                } else {
                    XCTAssertNil(board.piece(at: location))
                }
            }
        }
    }
}
