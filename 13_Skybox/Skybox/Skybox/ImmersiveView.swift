//
//  ImmersiveView.swift
//  Skybox
//
//  Created by xuchi on 2024/2/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @ObservedObject var arkitSessionManager = ARKitSessionManager()

    var body: some View {
        
        RealityView { content in
            // Object
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .white, isMetallic: true)]
            )
            sphere.position = [0.6, 1.5, -2]
            content.add(sphere)
            
            guard let environment = try? await EnvironmentResource(named: "shanghai_bund_4k") else {
                return
            }
            sphere.components.set(ImageBasedLightComponent(source: .single(environment)))
            sphere.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere))
            print("sphere rotation: \(sphere.transform.rotation)")
            
            // Skybox
            guard let resource = try? await TextureResource(named: "shanghai_bund_4k") else {
                fatalError("Unable to load texture.")
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))
            
            let skybox = Entity()
            skybox.components.set(ModelComponent(
                mesh: .generateSphere(radius: 0.25),
                materials: [material]
            ))
            print("rotation: \(skybox.transform.rotation)")
            
            skybox.position = [-0.6, 1.5, -2]
            skybox.scale *= .init(x: -1, y: 1, z: 1)
            
            content.add(skybox)
            
            let worldRotation = skybox.orientation(relativeTo: nil)
            print("world rotation: \(worldRotation)")
            
            let cood = arkitSessionManager.getOriginFromDeviceTransform()
            let entityPosition = SIMD3<Float>(0, skybox.transform.translation.y, 0)
            skybox.look(at: entityPosition, from: skybox.transform.translation, relativeTo: nil)
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
