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
    @State private var skybox = Entity()
    
    var body: some View {
        
        RealityView { content in
            // Object
            guard let environment = try? await EnvironmentResource(named: "shanghai_bund_4k") else {
                return
            }
            
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .white, isMetallic: true)]
            )
            sphere.position = [0.6, 1.5, -2]
            content.add(sphere)
            
            sphere.components.set(ImageBasedLightComponent(source: .single(environment)))
            sphere.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere))
            
            let sphere2 = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .white, isMetallic: false)]
            )
            sphere2.position = [-0.6, 1.5, -2]
            content.add(sphere2)
            sphere2.components.set(ImageBasedLightComponent(source: .single(environment)))
            sphere2.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere2))

            
            // Skybox
            guard let resource = try? await TextureResource(named: "shanghai_bund_4k_skybox") else {
                fatalError("Unable to load texture.")
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))
            
            skybox.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000),
                materials: [material]
            ))
            
            // Reverse x to let the picture applied to the inner side of skybox
            skybox.scale = .init(x: -1 * abs(skybox.scale.x), y: skybox.scale.y, z: skybox.scale.z)
            
            content.add(skybox)
        }
        .task {
            await arkitSessionManager.startSession()
            
            // The texture of the skybox is always facing the camera while the IBL is fixed worldwide
            // So we need to detect the rotation of camera and counter-rotate the skybox so that the IBL reflection fits the skybox image
            
            // Get the camera's transform
            let matrix = arkitSessionManager.getOriginFromDeviceTransform()
            
            // Calculate headset rotation in Y axis, there're 2 ways whose results are close
            // Solution 1. Matrix
            let angleYByMatrix = atan2(-matrix.columns.0.z, matrix.columns.2.z)
            let angleYByMatrixDegree = angleYByMatrix * 180.0 / .pi
            print("2. Matrix: \(angleYByMatrixDegree)")
            
            // Solution 2. Quaternion
            let quat: simd_quatf = simd_quatf(matrix)
            let angleYByQuaternion = calculateYRotateByQuaternion(quat: quat)
            let angleYByQuaternionDegree = angleYByQuaternion * 180 / .pi
            print("3. Quaternion: \(angleYByQuaternionDegree)")
            
            // .pi / 2 is the offset of current texture
            skybox.transform.rotation = simd_quatf(angle: -angleYByMatrix + .pi / 2, axis: [0, 1, 0])
            
            let skyRotationQuat = skybox.transform.rotation
            let angleRadians = calculateYRotateByQuaternion(quat: skyRotationQuat)
            let angleDegrees = angleRadians * 180 / .pi
            print("Result. Skybox: \(angleDegrees)")
        }
    }
    
    func calculateYRotateByQuaternion(quat: simd_quatf) -> Float {
        return atan2(2 * (quat.real * quat.imag.y + quat.imag.x * quat.imag.z), 1 - 2 * (quat.imag.y * quat.imag.y + quat.imag.z * quat.imag.z))
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
