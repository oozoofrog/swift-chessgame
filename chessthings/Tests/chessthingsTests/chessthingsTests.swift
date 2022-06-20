import XCTest
@testable import chessthings

final class chessthingsTests: XCTestCase {
    func testBoard() throws {
        let board = Board()
        board.prepare()
    }
}
