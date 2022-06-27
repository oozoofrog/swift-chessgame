//
//  OOZOOChessTests.swift
//  OOZOOChessTests
//
//  Created by jaychoi on 2022/06/27.
//

import XCTest
import chessthings
@testable import OOZOOChess

class OOZOOChessTests: XCTestCase {

    var model: BoardViewModel!
    
    override func setUpWithError() throws {
        model = BoardViewModel()
    }

    override func tearDownWithError() throws {
        
    }

    func testBehavior() {
        model.prepare()
        
        // 흑백의 첫 점수는 동일
        XCTAssertEqual(model.pointForBlack, 24)
        XCTAssertEqual(model.pointForWhite, 24)
        
        // 첫 턴은 백
        XCTAssertEqual(model.sideOfCurrentTurn, .white)
        
        // 백의 차례일 때 흑을 둘 수는 없다
        XCTAssertEqual(model.piece(at: .A2)?.description, Pawn(.black).description)
        model.set(location: .A2)
        XCTAssertFalse(model.selected(location: .A2))
        
        // 백의 차례일 때 백을 둘 수 있다
        XCTAssertEqual(model.piece(at: .A7)?.description, Pawn(.white).description)
        model.set(location: .A7)
        XCTAssertTrue(model.selected(location: .A7))
        
        // white pawn을 위로 한칸 이동한다
        model.move(to: .A6)
    }
}
