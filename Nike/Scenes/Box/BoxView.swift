//
//  BoxView.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import SwiftUI

struct BoxView: View {
    
    @StateObject private var viewModel: BoxViewModel
    
    @State private var isPaying: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(viewModel: BoxViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            
            Color.ui.white.edgesIgnoringSafeArea(.all)
            
            Image("font-nike-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(90))
                .scaleEffect(1.2)
            
            Image(self.viewModel.sneaker.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-45))
                .padding(.trailing, 0)
                .offset(x: -16, y: 16)
                .colorMultiply(.black)
                .blur(radius: 10)
                .opacity(0.2)
            
            Image(self.viewModel.sneaker.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-45))
                .padding(.trailing, 0)
                .offset(x: -32)
                .saturation(2)
            
            ZStack {
                VStack {
                    Spacer().frame(height: 90)
                    Text(self.viewModel.sneaker.name)
                        .font(.system(size: 26).weight(.bold))
                        .foregroundColor(Color.ui.black)
                    Text("Men's shoes")
                        .font(.system(size: 17).weight(.bold))
                        .foregroundColor(Color.gray.opacity(0.8))
                    
                    HStack(alignment: .top) {
                        VStack(spacing: 12) {
                            
                            Text("Size")
                                .font(.system(size: 15).bold())
                                .foregroundColor(Color.ui.black)
                            
                            Button {
                                
                            } label: {
                                Text("9")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.ui.black)
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.ui.gainsboro, lineWidth: 1)
                            )
                            
                            Button {
                                
                            } label: {
                                Text("9.5")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.ui.white)
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.ui.black)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.ui.black, lineWidth: 1)
                            )
                            
                            Button {
                                
                            } label: {
                                Text("10")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.ui.black)
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.ui.gainsboro, lineWidth: 1)
                            )
                            
                            Button {
                                
                            } label: {
                                Text("10.5")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.ui.black)
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.ui.gainsboro, lineWidth: 1)
                            )
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 12) {
                            
                            Text("Fav")
                                .font(.system(size: 15).bold())
                                .foregroundColor(Color.ui.black)
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "heart")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.ui.black)
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.ui.gainsboro, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            ZStack {
                VStack(spacing: 24) {
                    HStack(alignment: .bottom) {
                        VStack {
                            HStack(alignment: .center, spacing: 0) {
                                Text("$")
                                    .font(.system(size: 21).weight(.bold))
                                    .foregroundColor(Color.ui.black)
                                Text(self.viewModel.sneaker.price)
                                    .font(.system(size: 32).weight(.black))
                                    .foregroundColor(Color.ui.black)
                            }
                            Text("Price")
                                .font(.system(size: 14).weight(.medium))
                                .foregroundColor(Color.ui.black)
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 12) {
                            
                            ForEach(self.viewModel.sneaker.colors, id: \.self) { color in
                                Button {
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color(color))
                                        .frame(width: 12, height: 12)
                                }
                                .frame(width: 40, height: 40, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.ui.gainsboro, lineWidth: 1)
                                )
                            }
                            
                            Text("Color")
                                .font(.system(size: 15).bold())
                                .foregroundColor(Color.ui.black)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    Image("nike-box")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 240)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
         
            ZStack {
                VStack {
                    Text("Swipe down")
                        .font(.system(size: 14).weight(.medium))
                        .foregroundColor(Color.ui.black)
                    SlideControl() {
                        self.isPaying = true
                    }
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 40)
        }
        .navigationBarHidden(true)
        .overlay(content: {
            NavigationBar()
        })
        .sheet(isPresented: self.$isPaying) {
            self.presentationMode.wrappedValue.dismiss()
        } content: {
            PurchaseResultView()
        }
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        let sneaker = Sneaker(name: "Nike Air Max 270", price: "135", image: "nike-air-max-270-red", colors: [.black, .red, .orange])
        let viewModel = BoxViewModel(sneaker: sneaker)
        BoxView(viewModel: viewModel)
    }
}
