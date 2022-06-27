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
    let prepared = PreparedLocations()
    
    override func setUpWithError() throws {
        board = Board()
        board.prepare()
    }
    
    func testAction() {
        // Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력한다.
        // 색상별로 Pawn 1점, Bishop 3점, Luke 5점 계산한다.
        XCTAssertEqual(board.point(for: .black), 1 * 8 + 3 * 2 + 5 * 2)
        XCTAssertEqual(board.point(for: .white), 1 * 8 + 3 * 2 + 5 * 2)
        
        XCTAssertEqual(board.display(), """
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
        """)
        
        let rook1 = board.piece(at: Location.A1)! as! Rook
        XCTAssertFalse(board.move(to: Location.A2, from: Location.A1))
        
        let pawn = board.piece(at: Location.A2)! as! Pawn
        XCTAssertEqual(pawn.availableLocations(prepared.locations, from: Location.A2), [Location.A3])
        XCTAssertEqual(board.availableLocations(from: Location.A2), [Location.A3])
        
        // black pawn A2 > A3
        let result = board.move(to: Location.A3, from: Location.A2)
        XCTAssertTrue(result)
        XCTAssertEqual(board.location(of: pawn), Location.A3)
        
        XCTAssertEqual(board.display(), """
         ABCDEFGH
        1♜.♝..♝.♜
        2.♟♟♟♟♟♟♟
        3♟.......
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖.♗..♗.♖
         ABCDEFGH
        """)
        
        // black bishop C1 > D2
        let bishop = board.piece(at: Location.C1)! as! Bishop
        XCTAssertEqual(board.availableLocations(from: Location.C1), [])
        
        // pawn B2 > B3
        XCTAssertTrue(board.move(to: Location.B3, from: Location.B2))
        
        XCTAssertEqual(board.display(), """
         ABCDEFGH
        1♜.♝..♝.♜
        2..♟♟♟♟♟♟
        3♟♟......
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖.♗..♗.♖
         ABCDEFGH
        """)
        
        XCTAssertEqual(board.availableLocations(from: Location.C1), [Location.B2])
        
        XCTAssertFalse(board.move(to: Location.D2, from: Location.C1))
        
        XCTAssertEqual(board.location(of: bishop), Location.C1)
        
        XCTAssertTrue(board.move(to: Location.D3, from: Location.D2))
        
        XCTAssertEqual(board.availableLocations(from: Location.C1), [Location.B2, Location.D2])
        
        XCTAssertTrue(board.move(to: Location.D2, from: Location.C1))
        
        XCTAssertEqual(board.display(), """
         ABCDEFGH
        1♜....♝.♜
        2..♟♝♟♟♟♟
        3♟♟.♟....
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖.♗..♗.♖
         ABCDEFGH
        """)
    }
    
}
