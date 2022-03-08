//
//  NavigationBar.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import SwiftUI

struct NavigationBar: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.clear
                .background(Color.ui.white)

            HStack(alignment: .center) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "text.alignleft")
                        .font(.system(size: 21))
                        .foregroundColor(Color.ui.black)
                }
                .frame(width: 40, height: 40, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.ui.gainsboro, lineWidth: 1)
                )
                .padding(.leading, 12)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 8) {
                    Image("nike-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65)
                        .opacity(0.7)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bag")
                        .font(.system(size: 21))
                        .foregroundColor(Color.ui.black)
                }
                .frame(width: 40, height: 40, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.ui.gainsboro, lineWidth: 1)
                )
                .padding(.trailing, 12)
            }
        }
        .frame(height: 68)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
