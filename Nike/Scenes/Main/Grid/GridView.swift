//
//  GridView.swift
//  Nike
//
//  Created by Leandro Hernandez on 6/3/22.
//

import SwiftUI

struct GridView: View {
    
    private let columnsScheme: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16), count: 2)
    
    var items: [MainView.SneakerListItem]
    
    var body: some View {
        LazyVGrid(columns: self.columnsScheme, spacing: 16) {
            ForEach(self.items) { item in
                GridItemView(item: item)
            }
        }
    }
}
