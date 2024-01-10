//
//  ImmersiveView.swift
//  FaceMe
//
//  Created by xuchi on 2024/1/10.
//

import SwiftUI
import RealityKit
import RealityKitContent
import ARKit

struct ImmersiveView: View {
    @State var entity = Entity()
    @ObservedObject var arkitSessionManager = ARKitSessionManager()

    var body: some View {
        RealityView { content in
            let tv = try! await Entity(named: "tv_retro")
            tv.transform.rotation = simd_quatf(angle: .pi, axis: [0, 1, 0])
            entity.addChild(tv)

            let followComponent = FaceComponent(manager: arkitSessionManager)
            entity.components[FaceComponent.self] = followComponent
            entity.position = SIMD3<Float>(x: 0, y: 1, z: 0)
            content.add(entity)
        }
        .task {
            await arkitSessionManager.startSession()
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
