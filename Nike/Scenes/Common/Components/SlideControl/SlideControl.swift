//
//  SlideControl.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import SwiftUI

struct SlideControl: View {
    
    @State private var dragValue: CGFloat = 0
    
    @State private var dragProgress: CGFloat = 0
    
    var sliderHeight: CGFloat = 120
    
    var sliderWidth: CGFloat = 70
    
    var finishProgressTarget: CGFloat = 0.95
    
    var borderSpacing: CGFloat = 8
    
    var completion: (() -> Void)?
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.ui.black)
                VStack {
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white.opacity(0.4))
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white.opacity(0.7))
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
                .opacity(1-self.dragProgress)
                .padding(.bottom, self.borderSpacing*2)
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(
                        width: self.sliderWidth - self.borderSpacing * 2,
                        height: self.sliderWidth - self.borderSpacing * 2
                    )
                    .cornerRadius(self.sliderWidth/2)
                    .overlay(content: {
                        Image(systemName: "bag")
                            .foregroundColor(Color.ui.white)
                    })
                    .padding(.top, self.dragValue + self.borderSpacing)
            }
            .frame(width: self.sliderWidth, height: self.sliderHeight)
            .cornerRadius(self.sliderWidth/2)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        
                        let translation = value.translation
                        
                        if translation.height < 0 {
                            self.dragValue = 0
                        } else if translation.height > self.sliderHeight - self.sliderWidth {
                            self.dragValue = self.sliderHeight - self.sliderWidth
                        } else {
                            self.dragValue = translation.height
                        }
                        
                        self.dragProgress = self.dragValue / (self.sliderHeight - self.sliderWidth)
                    })
                    .onEnded({ value in
                        
                        if self.dragProgress > self.finishProgressTarget {
                            
                            self.completion?()
                            
                            withAnimation(Animation.easeIn(duration: 0.1)) {
                                self.dragValue = self.sliderHeight-self.sliderWidth
                                self.dragProgress = 100
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                withAnimation(Animation.easeIn(duration: 0.1)) {
                                    self.dragValue = 0
                                    self.dragProgress = 0
                                }
                            }
                            
                        } else {
                            withAnimation(Animation.easeIn(duration: 0.1)) {
                                self.dragValue = 0
                                self.dragProgress = 0
                            }
                        }
                    })
            )
        }
        
    }
}

struct SlideControl_Previews: PreviewProvider {
    static var previews: some View {
        SlideControl()
    }
}
