//
//  ImmersiveView.swift
//  VideoMaterial
//
//  Created by xuchi on 2024/1/31.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVKit

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let tv = try! await Entity(named: "tv_retro")
            tv.position = SIMD3<Float>(x: 0, y: 1, z: -1.5)
            if let screen = tv.findEntity(named: "tv_retro_2_RetroTVScreen") as? ModelEntity {
                if let url = Bundle.main.url(forResource: "GetReadyRemixRB", withExtension: "mp4") {
                    let player = AVPlayer(url: url)
                    
                    
                    let material = VideoMaterial(avPlayer: player)
                    screen.model?.materials = [material]
                    player.play()
                }
            }
            content.add(tv)
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
