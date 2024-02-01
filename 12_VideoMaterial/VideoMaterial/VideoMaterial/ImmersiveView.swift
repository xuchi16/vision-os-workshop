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
    @State var entity = Entity()
    
    var playModel: PlayModel
    
    var body: some View {
        RealityView { content, attachments in
            let tv = try! await Entity(named: "tv_retro")
            tv.position = SIMD3<Float>(x: 0, y: 1, z: -1.5)
            if let screen = tv.findEntity(named: "tv_retro_2_RetroTVScreen") as? ModelEntity {
                let player = playModel.player
                let material = VideoMaterial(avPlayer: player)
                screen.model?.materials = [material]
                player.play()
            }
            
            entity.addChild(tv)
            if let attachment = attachments.entity(for: "controller") {
                attachment.position = [0, 0.98, -1.2]
                entity.addChild(attachment)
            }
            
            content.add(entity)
        } attachments: {
            Attachment(id: "controller") {
                ControllerView(playModel: playModel)
            }
        }
        .onAppear() {
            if let url = Bundle.main.url(forResource: "GetReadyRemixRB", withExtension: "mp4") {
                playModel.load(url)
            }
        }
    }
}

#Preview {
    ImmersiveView(playModel: PlayModel())
        .previewLayout(.sizeThatFits)
}
