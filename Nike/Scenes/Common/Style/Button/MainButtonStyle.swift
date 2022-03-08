//
//  MainButtonStyle.swift
//  Nike
//
//  Created by Leandro Hernandez on 8/3/22.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
    
    var foregroundColor: Color = Color.ui.culture
    
    var backgroundColor: Color = Color.ui.black

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(self.foregroundColor(configuration: configuration))
            .font(.system(size: 17).weight(.bold))
            .frame(height: 56, alignment: .center)
            .frame(maxWidth: .infinity)
            .background(self.backgroundColor(configuration: configuration))
            .cornerRadius(16)
            .padding(.horizontal, 24)
    }
    
    private func foregroundColor(configuration: Configuration) -> Color {
        if self.isEnabled {
            return configuration.isPressed ? self.foregroundColor.opacity(0.8) : self.foregroundColor
        } else {
            return self.foregroundColor.opacity(0.8)
        }
    }
    
    private func backgroundColor(configuration: Configuration) -> Color {
        if self.isEnabled {
            return configuration.isPressed ? self.backgroundColor.opacity(0.8) : self.backgroundColor
        } else {
            return self.backgroundColor.opacity(0.5)
        }
    }
}
