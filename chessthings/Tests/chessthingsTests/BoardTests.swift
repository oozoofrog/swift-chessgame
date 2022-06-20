//
//  BoardTests.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import XCTest
@testable import chessthings

class BoardTests: XCTestCase {

    var board: Board!
    
    override func setUpWithError() throws {
        board = Board()
        board.prepare()
    }
    
    func testAction() {
        // Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력한다.
        // 색상별로 Pawn 1점, Bishop 3점, Luke 5점 계산한다.
        XCTAssertEqual(board.point(for: .black), 1 * 8 + 3 * 2 + 5 * 2)
        XCTAssertEqual(board.point(for: .white), 1 * 8 + 3 * 2 + 5 * 2)
        
        let expect = """
         ABCDEFGH
        1♜.♝..♝.♜
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖.♗..♗.♖
         ABCDEFGH
        """
        let dispaly = board.display()
        XCTAssertEqual(dispaly, expect, "\n\(dispaly)\nis not equal\n\(expect)")
        
        let piece = board.piece(at: Location.A2)
        XCTAssertNotNil(piece)
        XCTAssertEqual(board.availableLocations(from: Location.A2), [Location.A3])
        
        let result = board.move(to: Location.A3, from: Location.A2)
        XCTAssertTrue(result)
        XCTAssertEqual(piece?.location, Location.A3)
    }
    
}
