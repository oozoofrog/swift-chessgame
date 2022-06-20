import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    
    func testBoardPrepare() throws {
        
        var locations: [Location] = []
        for file in File.allCases {
            for rank in Rank.allCases {
                locations.append(Location(file: file, rank: rank))
            }
        }
        
        let board = Board()
    
        for location in locations {
            XCTAssertNil(board.piece(at: location))
        }
        
        board.prepare()
        
        
    }
}
