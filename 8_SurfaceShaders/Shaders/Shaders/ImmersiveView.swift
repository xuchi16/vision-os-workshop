//
//  ImmersiveView.swift
//  Shaders
//
//  Created by xuchi on 2024/1/11.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(ViewModel.self) var model
    
    @State private var sliderValue: Float = 0
    private let attachmentOffset: SIMD3<Float> = [0, -0.01, 0]
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                if let box1 = scene.findEntity(named: "Box1") as? ModelEntity {
                    model.boxes.append(box1)
                }
                if let box2 = scene.findEntity(named: "Box2") as? ModelEntity {
                    model.boxes.append(box2)
                }
                model.update()
                content.add(scene)
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
