//
//  ImmersiveView.swift
//  PBR
//
//  Created by xuchi on 2024/1/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    private let radius: Float = 0.08
    private let interval: Float = 0.2
    private let initPosition = SIMD3<Float>(x: 0, y: 0.4, z: -3)
    private let matrixSize = 5
    
    var outerEntity = Entity()

    
    var tapGesture: some Gesture {
        TapGesture()
            .targetedToAnyEntity()
            .onEnded { c in
                if let modelEntity = c.entity as? ModelEntity {
                    let materials = modelEntity.model?.materials
                    if let material = materials?.first as? PhysicallyBasedMaterial {
                        print("roughness: \(material.roughness.scale), metallic: \(material.metallic.scale), transparency:\(material.blending)")
                    }
                }
            }
    }
    
    var body: some View {
        RealityView { content in
            
            for roughness in 0...matrixSize {
                for metallic in 0...matrixSize {
                    for opacity in 0...matrixSize {
                        let r = Float(roughness)
                        let m = Float(metallic)
                        let o = Float(opacity)
                        let xOffset = interval * r
                        let yOffset = interval * m
                        let zOffset = interval * o
                        let position = SIMD3<Float>(x: initPosition.x + xOffset, y: initPosition.y + yOffset, z: initPosition.z + zOffset)
                        
                        var material = PhysicallyBasedMaterial()
                        material.baseColor = PhysicallyBasedMaterial.BaseColor(tint:.orange)
                        material.roughness = PhysicallyBasedMaterial.Roughness(floatLiteral: 0.2 * r)
                        material.metallic = PhysicallyBasedMaterial.Metallic(floatLiteral: 0.2 * m)
                        material.blending = .transparent(opacity: .init(floatLiteral: 0.2 * o))
                        
                        let sphere = ModelEntity(
                            mesh: .generateSphere(radius: radius),
                            materials: [material],
                            collisionShape: .generateSphere(radius: radius),
                            mass: 0.0
                        )
                        sphere.components.set(InputTargetComponent(allowedInputTypes: .indirect))

                        sphere.position = position
                        outerEntity.addChild(sphere)
                    }
                }
            }
            content.add(outerEntity)
            
        }
        .gesture(tapGesture)
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
