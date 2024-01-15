//
//  ImmersiveView.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @State var floor = Entity()
    @State var car = Entity()
    
    @Environment(ViewModel.self) var model

    var body: some View {
        RealityView { content in
            // Car
            car = try! await Entity(named: "toy_car")
            car.transform.rotation = simd_quatf(angle: .pi, axis: [0, 1, 0])
            car.components[CollisionComponent.self] = CollisionComponent(shapes: [.generateBox(size: SIMD3(repeating: 1.0))])
            
            car.position = SIMD3(x: 0, y: 0.95, z: -2)
            let carBody = PhysicsBodyComponent()
            car.components[PhysicsBodyComponent.self] = carBody
            car.enumerateHierarchy { entity, stop in
                if entity is ModelEntity {
                    entity.components.set(GroundingShadowComponent(castsShadow: true))
                }
            }
            
            car.components[MoveComponent.self] = MoveComponent(model: model)
            content.add(car)
            
            // Floor
            let floorMaterial = SimpleMaterial(color: .white, roughness: 1, isMetallic: false)
            floor = ModelEntity(
                mesh: .generateBox(width: 3, height: 0.01, depth: 2),
                materials: [floorMaterial],
                collisionShape: .generateBox(width: 3, height: 0.01, depth: 2),
                mass: 0.0
            )
            floor.position = SIMD3(x: 0.0, y: 0.9, z: -2)
            var floorBody = PhysicsBodyComponent()
            floorBody.isAffectedByGravity = false
            floorBody.mode = .static
            floor.components[PhysicsBodyComponent.self] = floorBody
            content.add(floor)
        }
        .shadow(radius: 12)
    }
    
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
