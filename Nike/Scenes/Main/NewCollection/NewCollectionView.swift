//
//  NewCollectionView.swift
//  Nike
//
//  Created by Leandro Hernandez on 6/3/22.
//

import SwiftUI

struct NewCollectionView: View {
    
    var items: [MainView.SneakerListItem]
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("New collection")
                    .font(.system(size: 28))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.ui.black)
                
                Text("Nike original 2022")
                    .font(.system(size: 17))
                    .foregroundColor(Color.ui.fireOpal)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
            .padding(.horizontal, 16)
            
            if self.items.isEmpty {
                Spacer().frame(height: 240)
            } else {
                TabView {
                    ForEach(self.items.indices) { index in
                        VStack {
                            CardView(item: self.items[index])
                                .padding(.horizontal, 16)
                            Spacer()
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 260)
            }
        }
    }
}
