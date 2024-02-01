//
//  ControllerView.swift
//  VideoMaterial
//
//  Created by xuchi on 2024/2/1.
//

import SwiftUI

struct ControllerView: View {
    @ObservedObject var playModel = PlayModel()
    
    var body: some View {
        
        Button(action: {
            playModel.togglePlayPause()
            
        }) {
            Image(systemName: playModel.isPlaying ? "pause.fill" : "play.fill")
                .font(.system(size: 40))
                .accessibilityLabel(playModel.isPlaying ? "Pause" : "Play")
                .padding(.all, 40)
        }
        .padding(12)
    }
    
}

#Preview {
    ControllerView(playModel: PlayModel())
}
