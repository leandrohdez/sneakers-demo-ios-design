//
//  PurchaseResultView.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import SwiftUI
import Lottie

struct PurchaseResultView: View {
    
    var body: some View {
        ZStack {
            Color.ui.white.edgesIgnoringSafeArea(.all)
            
            Image("font-nike-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(90))
                .scaleEffect(1.2)
            
            VStack {
                
                LottieView(
                    animationName: "9912-payment-success",
                    loopMode: .playOnce,
                    contentMode: .scaleAspectFit
                )
                .frame(width: 300, height: 300)
                
                Text("Purchase completed")
                    .font(.system(size: 26).weight(.bold))
                    .foregroundColor(Color.ui.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 8)
                
                Text("Your purchase is on its way")
                    .font(.system(size: 19).weight(.bold))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                
            }
            .offset(y: -56)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct PurchaseResultView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseResultView()
    }
}
