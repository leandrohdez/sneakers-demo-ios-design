//
//  TabBar.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "home-tab"
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: self.$current) {
                MainView()
                    .tag("home-tab")
                
                Text("Search Here")
                    .tag("search-tab")
                
                Text("Like Here")
                    .tag("like-tab")
                    .navigationBarHidden(true)
            }
            
            HStack(spacing: 0) {
                
                Spacer(minLength: 0)
                
                Button {
                    self.current = "home-tab"
                } label: {
                    Image(systemName: "house")
                        .font(.system(size: 18))
                        .foregroundColor(Color.ui.black)
                }
                .padding()
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.current = "search-tab"
                }) {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 64, height: 64)
                        .foregroundColor(Color.ui.white)
                        .background(Color.ui.black)
                        .clipShape(Circle())
                        .shadow(color: Color.ui.black.opacity(0.4), radius: 4, x: 2, y: 2)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    self.current = "like-tab"
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 18))
                        .foregroundColor(Color.ui.black)
                }
                .padding()
                
                Spacer(minLength: 0)
            }
            .padding(.vertical, 8)
            .frame(height: 64)
            .background(Color.ui.white)
            .navigationBarHidden(true)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
