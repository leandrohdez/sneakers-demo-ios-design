//
//  CardView.swift
//  SwipeToAction
//
//  Created by Ginger on 30/01/2021.
//

import SwiftUI

struct CardView: View {
    
    var item: MainView.SneakerListItem

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(self.item.sneaker.name)
                                .font(.system(size: 21).weight(.bold))
                                .foregroundColor(Color.ui.black)
                            Text("Men's shoes")
                                .font(.system(size: 15).weight(.medium))
                                .foregroundColor(Color.gray)
                        }
                        NavigationLink("Shop now") {
                            BoxView(viewModel: BoxViewModel(sneaker: self.item.sneaker))
                        }
                        .navigationViewStyle(.stack)
                        .buttonStyle(BuyButtonStyle())
                    }
                    .padding(.leading, 24)
                    Spacer(minLength: 150)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 170)
                .background(Color.ui.culture)
                .cornerRadius(20)
                .padding(.horizontal, 0)
            }
            
            ZStack {
                Image(self.item.sneaker.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240)
                    .rotationEffect(.degrees(-45))
                    .padding(.trailing, 0)
                    .offset(x: 24, y: 14)
                    .colorMultiply(.black)
                    .blur(radius: 10)
                    .opacity(0.2)
                
                Image(self.item.sneaker.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220)
                    .rotationEffect(.degrees(-45))
                    .padding(.trailing, 0)
                    .offset(x: 24, y: 4)
                    .saturation(2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 210)
    }
}
