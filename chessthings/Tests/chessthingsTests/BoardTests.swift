//
//  BoardTests.swift
//  
//
//  Created by jaychoi on 2022/06/20.
//

import XCTest
@testable import chessthings

class BoardTests: XCTestCase {

    var board: Board!
    
    override func setUpWithError() throws {
        board = Board()
        board.prepare()
    }
    
    

}
