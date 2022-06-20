//
//  PiecesTests.swift
//  
//
//  Created by jaychoi on 2022/06/20.
//

import XCTest
@testable import chessthings

class PiecesTests: XCTestCase {

    func testPawn() {
        let blackPawn = Pawn(.black, location: .init(file: .A, rank: .two))
        XCTAssertEqual(blackPawn?.icon, "♟")
        XCTAssertEqual(blackPawn?.point, 1)
        
        let whitePawn = Pawn(.white, location: .init(file: .A, rank: .seven))
        XCTAssertEqual(whitePawn?.icon, "♙")
        XCTAssertEqual(whitePawn?.point, 1)
    }
    
    func testBishop() {
        let blackBishop = Bishop(.black, location: .init(file: .C, rank: .one))
        XCTAssertEqual(blackBishop?.icon, "♝")
        XCTAssertEqual(blackBishop?.point, 3)
        
        let whiteBishop = Bishop(.white, location: .init(file: .C, rank: .eight))
        XCTAssertEqual(whiteBishop?.icon, "♗")
        XCTAssertEqual(whiteBishop?.point, 3)
    }
    
    func testLuke() {
        let blackLuke = Luke(.black, location: .init(file: .A, rank: .one))
        XCTAssertEqual(blackLuke?.icon, "♜")
        XCTAssertEqual(blackLuke?.point, 5)
        
        let whiteLuke = Luke(.white, location: .init(file: .A, rank: .eight))
        XCTAssertEqual(whiteLuke?.icon, "♖")
        XCTAssertEqual(whiteLuke?.point, 5)
    }
    
}
