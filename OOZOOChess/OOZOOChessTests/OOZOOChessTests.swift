//
//  OOZOOChessTests.swift
//  OOZOOChessTests
//
//  Created by jaychoi on 2022/06/27.
//

import XCTest
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
        
        // 첫 턴은 black
        XCTAssertEqual(model.sideOfCurrentTurn, .black)
    }
}
