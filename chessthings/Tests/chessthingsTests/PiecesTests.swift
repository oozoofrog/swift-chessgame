//
//  PiecesTests.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import XCTest
@testable import chessthings

class PiecesTests: XCTestCase {
    
    func testPawn() {
        let blackPawn = Pawn(.black)
        XCTAssertEqual(blackPawn.icon, "♟")
        XCTAssertEqual(blackPawn.point, 1)
        
        XCTAssertEqual(blackPawn.available(to: .init(file: .A, rank: .one), from: .init(file: .A, rank: .two)), false)
             
        let whitePawn = Pawn(.white)
        XCTAssertEqual(whitePawn.icon, "♙")
        XCTAssertEqual(whitePawn.point, 1)
    }
    
    func testBishop() {
        let blackBishop = Bishop(.black)
        XCTAssertEqual(blackBishop.icon, "♝")
        XCTAssertEqual(blackBishop.point, 3)
        
        let whiteBishop = Bishop(.white)
        XCTAssertEqual(whiteBishop.icon, "♗")
        XCTAssertEqual(whiteBishop.point, 3)
    }
    
    func testLuke() {
        let blackLuke = Luke(.black)
        XCTAssertEqual(blackLuke.icon, "♜")
        XCTAssertEqual(blackLuke.point, 5)
        
        let whiteLuke = Luke(.white)
        XCTAssertEqual(whiteLuke.icon, "♖")
        XCTAssertEqual(whiteLuke.point, 5)
    }
    
}
