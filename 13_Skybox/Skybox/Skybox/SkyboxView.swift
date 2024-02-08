//
//  SkyboxView.swift
//  Skybox
//
//  Created by xuchi on 2024/2/7.
//

import SwiftUI
import RealityKit

struct SkyboxView: View {
    var body: some View {
        RealityView { content in
            guard let resource = try? await TextureResource(named: "shanghai_bund_4k") else {
                fatalError("Unable to load texture.")
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))

            let entity = Entity()
            entity.components.set(ModelComponent(
                mesh: .generateSphere(radius: 0.25),
                materials: [material]
            ))
            entity.position = [-0.6, 1.5, -2]

            entity.scale *= .init(x: -1, y: 1, z: 1)
//            entity.transform.rotation = simd_quatf(angle: .pi * 3 / 2, axis: [0, 1, 0])

            content.add(entity)
        }
    }
}

#Preview {
    SkyboxView()
}
