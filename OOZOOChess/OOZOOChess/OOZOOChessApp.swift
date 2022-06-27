//
//  OOZOOChessApp.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import SwiftUI

@main
struct OOZOOChessApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: BoardViewModel())
        }
    }
}
