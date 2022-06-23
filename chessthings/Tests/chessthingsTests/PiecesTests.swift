//
//  PiecesTests.swift
//  
//
//  Created by oozoofrog on 2022/06/20.
//

import XCTest
@testable import chessthings

class PiecesTests: XCTestCase {
    
    let prepare = PreparedLocations()
    
    func testPawn() {
        let blackPawn = Pawn(.black)
        XCTAssertEqual(blackPawn.icon, "♟")
        XCTAssertEqual(blackPawn.point, 1)
        
        let whitePawn = Pawn(.white)
        XCTAssertEqual(whitePawn.icon, "♙")
        XCTAssertEqual(whitePawn.point, 1)
        
        let blacks = File.allCases.map({ Location(file: $0, rank: .two) })
        let whites = File.allCases.map({ Location(file: $0, rank: .seven) })
        let remains = prepare.locations.filter({ !blacks.contains($0) && !whites.contains($0) })
        for remain in remains {
            XCTAssertFalse(blackPawn.available(to: remain), remain.description)
            XCTAssertFalse(whitePawn.available(to: remain), remain.description)
        }
        for black in blacks {
            XCTAssertTrue(blackPawn.available(to: black))
        }
        for white in whites {
            XCTAssertTrue(whitePawn.available(to: white))
        }
    }
    
    func testBishop() {
        let blackBishop = Bishop(.black)
        XCTAssertEqual(blackBishop.icon, "♝")
        XCTAssertEqual(blackBishop.point, 3)
        
        let whiteBishop = Bishop(.white)
        XCTAssertEqual(whiteBishop.icon, "♗")
        XCTAssertEqual(whiteBishop.point, 3)
        
        let blacks: [Location] = [.C1, .F1]
        let whites: [Location] = [.C8, .F8]
        let remains = prepare.locations.filter({ !blacks.contains($0) && !whites.contains($0) })
        for remain in remains {
            XCTAssertFalse(blackBishop.available(to: remain), remain.description)
            XCTAssertFalse(whiteBishop.available(to: remain), remain.description)
        }
        for black in blacks {
            XCTAssertTrue(blackBishop.available(to: black))
        }
        for white in whites {
            XCTAssertTrue(whiteBishop.available(to: white))
        }
    }
    
    func testLuke() {
        let blackLuke = Luke(.black)
        XCTAssertEqual(blackLuke.icon, "♜")
        XCTAssertEqual(blackLuke.point, 5)
        
        let whiteLuke = Luke(.white)
        XCTAssertEqual(whiteLuke.icon, "♖")
        XCTAssertEqual(whiteLuke.point, 5)
        
        let blacks: [Location] = [.C1, .F1]
        let whites: [Location] = [.C8, .F8]
        let remains = prepare.locations.filter({ !blacks.contains($0) && !whites.contains($0) })
        for remain in remains {
            XCTAssertFalse(blackLuke.available(to: remain), remain.description)
            XCTAssertFalse(whiteLuke.available(to: remain), remain.description)
        }
        for black in blacks {
            XCTAssertTrue(blackLuke.available(to: black))
        }
        for white in whites {
            XCTAssertTrue(whiteLuke.available(to: white))
        }
    }
    
}
