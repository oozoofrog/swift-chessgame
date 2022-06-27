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
        VStack {
            Spacer()
            HStack {
                Spacer()
                LazyVGrid(columns: columnGridItems) {
                    ForEach(0..<model.rankCount) { column in
                        ForEach(0..<model.fileCount) { row in
                            LazyHGrid(rows: rowGridItems) {
                                Text(model.icon(column: column, row: row))
                                    .font(.largeTitle.monospaced())
                                    .fixedSize()
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
            Spacer()
        }.onAppear {
            model.prepare()
        }
    }
    
    var columnGridItems: [GridItem] {
        [GridItem](repeating: GridItem(.fixed(24), spacing: 7, alignment: .center), count: model.rankCount)
    }
    
    var rowGridItems: [GridItem] {
        [GridItem](repeating: GridItem(.fixed(0), spacing: 0, alignment: .center), count: model.fileCount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: BoardViewModel())
    }
}
