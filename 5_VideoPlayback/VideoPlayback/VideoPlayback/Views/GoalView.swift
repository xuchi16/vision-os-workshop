//
//  GoalView.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/2.
//

import SwiftUI

struct GoalView: View {
    @State private var moveText = true
    @State private var scrollOffset = CGFloat(1510)
    
    let slogan = "GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!  GOAL!!!"
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        Text(slogan)
            .font(.largeTitle)
            .fontWeight(.bold)
            .overlay(gradient)
            .mask(Text(slogan)
                .font(.largeTitle)
                .fontWeight(.bold)
            )
            .offset(x: scrollOffset, y: 0)
            .onAppear() {
                withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                    scrollOffset = -getTextWidth(text: slogan, font: UIFont.systemFont(ofSize: 17))
                }
            }
    }
    
    func getTextWidth(text: String, font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}

#Preview {
    GoalView()
}
