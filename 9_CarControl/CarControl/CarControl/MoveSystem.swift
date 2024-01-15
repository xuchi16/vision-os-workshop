//
//  MoveSystem.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import SwiftUI
import RealityKit

public struct MoveSystem: System {
    
    private let forward = SIMD3<Float>(0, 0, 1)
    private let backward = SIMD3<Float>(0, 0, -1)
    
    
    static let moveQuery = EntityQuery(where: .has(MoveComponent.self))
    
    public init(scene: RealityKit.Scene) {
    }
    
    public func update(context: SceneUpdateContext) {
        let entities = context.scene.performQuery(Self.moveQuery)
        
        for entity in entities {
            
            guard let moveComponent = entity.components[MoveComponent.self] else {
                continue
            }
            
            let deltaTime = Float(context.deltaTime)
            if moveComponent.model.forward {
                let forwardDirection = entity.transform.rotation.act(forward)
                entity.transform.translation += forwardDirection * moveComponent.speed * deltaTime
            }
            if moveComponent.model.backward {
                let backwardDirection = entity.transform.rotation.act(backward)
                entity.transform.translation += backwardDirection * moveComponent.speed * deltaTime
            }
            if moveComponent.model.left || moveComponent.model.right {
                entity.orientation = simd_mul(entity.orientation,
                                              simd_quatf(angle: moveComponent.turnSpeed * deltaTime, axis: moveComponent.getDirection()))
            }
        }
    }
    
}
