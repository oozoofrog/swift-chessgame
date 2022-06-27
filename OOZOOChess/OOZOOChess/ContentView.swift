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
                    ForEach(0..<model.gridCount, id: \.self) { index in
                        let (column, row) = model.position(at: index)
                        Text(model.icon(column: column, row: row))
                            .font(.largeTitle.monospaced())
                            .fixedSize()
                            .background(backgroundColor(column: column, row: row))
                            .onTapGesture {
                                self.model.setLocation(column: column, row: row)
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
    
    func backgroundColor(column: Int, row: Int) -> Color {
        if model.selectedLocation(column: column, row: row) {
            return .red
        } else if model.availableLocation(column: column, row: row) {
            return .blue
        } else {
            return .clear
        }
    }
    
    var columnGridItems: [GridItem] {
        [GridItem](repeating: GridItem(.fixed(24), spacing: 7, alignment: .center), count: model.columnCount)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: BoardViewModel())
    }
}
