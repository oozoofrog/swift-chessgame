//
//  ContentView.swift
//  OOZOOChess
//
//  Created by jaychoi on 2022/06/27.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: BoardViewModel
    
    var body: some View {
        LazyVGrid(columns: verticalGridItems) {
            LazyHGrid(rows: horizontalGridItems) {
                Text("A")
            }
        }
    }
    
    var verticalGridItems: [GridItem] {
        []
    }
    
    var horizontalGridItems: [GridItem] {
        []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: BoardViewModel())
    }
}
