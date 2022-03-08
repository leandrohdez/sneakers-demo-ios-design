//
//  GridItemView.swift
//  Nike
//
//  Created by Leandro Hernandez on 6/3/22.
//

import SwiftUI

struct GridItemView: View {
    
    var item: MainView.SneakerListItem
    
    var body: some View {
        ZStack {
            Color.ui.culture
            VStack(alignment: .leading, spacing: 8) {
                Text(self.item.sneaker.name)
                    .font(.system(size: 19).weight(.bold))
                HStack(spacing: 6) {
                    
                    ForEach(self.item.sneaker.colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(color))
                            .frame(width: 12, height: 12)
                    }
                }
                ZStack {
                    Image(self.item.sneaker.image)
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: -45))
                        .offset(y: -8)
                        .scaleEffect(1.15)
                        .colorMultiply(.black)
                        .blur(radius: 10)
                        .opacity(0.2)
                    
                    Image(self.item.sneaker.image)
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: -45))
                        .offset(y: -16)
                        .saturation(2)
                }
                .frame(height: 112)
                HStack {
                    VStack {
                        HStack(alignment: .center, spacing: 0) {
                            Text("$")
                                .font(.system(size: 14).weight(.bold))
                                .foregroundColor(Color.ui.black)
                            Text(self.item.sneaker.price)
                                .font(.system(size: 19).weight(.bold))
                                .foregroundColor(Color.ui.black)
                        }
                        Text("Price".lowercased())
                            .font(.system(size: 14).weight(.medium))
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    
                    NavigationLink {
                        BoxView(viewModel: BoxViewModel(sneaker: self.item.sneaker))
                    } label: {
                        Image(systemName: "arrow.forward")
                            .font(.system(size: 21))
                            .foregroundColor(Color.ui.black)
                    }
                    .frame(width: 44, height: 44, alignment: .center)
                    .background(Color.ui.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.ui.gainsboro, lineWidth: 1)
                    )
                }
            }
            .padding(16)
        }
        .cornerRadius(20)
    }
}
