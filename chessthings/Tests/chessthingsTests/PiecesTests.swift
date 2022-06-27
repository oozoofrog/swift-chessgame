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
    
    func testRook() {
        let blackRook = Rook(.black)
        XCTAssertEqual(blackRook.icon, "♜")
        XCTAssertEqual(blackRook.point, 5)
        
        let whiteRook = Rook(.white)
        XCTAssertEqual(whiteRook.icon, "♖")
        XCTAssertEqual(whiteRook.point, 5)
        
        let blacks: [Location] = [.A1, .H1]
        let whites: [Location] = [.A8, .H8]
        let remains = prepare.locations.filter({ !blacks.contains($0) && !whites.contains($0) })
        for remain in remains {
            XCTAssertFalse(blackRook.available(to: remain), remain.description)
            XCTAssertFalse(whiteRook.available(to: remain), remain.description)
        }
        for black in blacks {
            XCTAssertTrue(blackRook.available(to: black))
        }
        for white in whites {
            XCTAssertTrue(whiteRook.available(to: white))
        }
        
        // 뭘 테스트 해야하더라.....
        // 룩은 대각선 이동은 안되고 현재 위치에서 위 아래 혹은 좌 우로만 이동이 가능하다
        // 블랙 룩 하나를 테스트 해보자
        let black = Rook(.black)
        let from = Location(file: .D, rank: .four)
        // 여기서 이동이 가능한 위치는
        // rank == 4 인 경우 file == C|E
        // file == D 인 경우 rank == 3|5
        // 이 외에는 다 실패
        let availableLocations = [Location(file: .C, rank: .four),
                                  Location(file: .E, rank: .four),
                                  Location(file: .D, rank: .three),
                                  Location(file: .D, rank: .five)]
        
        for location in prepare.locations {
            let available = black.available(to: location, from: from)
            let description = "\(from) > \(location) == \(available)"
            if availableLocations.contains(location) {
                XCTAssertTrue(available, description)
            } else {
                XCTAssertFalse(available, description)
            }
        }
    }
    
}
