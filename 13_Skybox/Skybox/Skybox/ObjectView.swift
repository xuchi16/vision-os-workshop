//
//  ObjectView.swift
//  Skybox
//
//  Created by xuchi on 2024/2/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ObjectView: View {
    var body: some View {
        RealityView { content in
            
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .white, isMetallic: true)]
            )
            sphere.position = [0.6, 1.5, -2]
            content.add(sphere)
            
            async let environment = EnvironmentResource.load(named: "shanghai_bund_4k")
            
            if let environment = try? await environment {
                sphere.components.set(ImageBasedLightComponent(source: .single(environment)))
                sphere.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere))
            }
        }
    }
}
#Preview {
    ObjectView()
}
