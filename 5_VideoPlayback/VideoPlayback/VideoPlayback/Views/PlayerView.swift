//
//  PlayerView.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/2.
//

import SwiftUI
import AVFoundation
import AVKit

struct PlayerView: UIViewControllerRepresentable {
    
    @Environment(PlayerModel.self) private var playerModel
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = playerModel.genViewController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}

#Preview {
    PlayerView()
}
