//
//  MoveSystem.swift
//  ObjectMovement
//
//  Created by xuchi on 2024/1/8.
//

import Foundation
import RealityKit
import RealityKitContent
import os

public struct MoveSystem: System {
    static let moveQuery = EntityQuery(where: .has(MoveComponent.self))
    
    public init(scene: Scene) {
    }
    
    public func update(context: SceneUpdateContext) {
        let entities = context.scene.performQuery(Self.moveQuery)
        
        for entity in entities {
            guard var moveComponent = entity.components[MoveComponent.self] else {
                continue
            }
            
            if moveComponent.movementEnabled() {
                // Update angle
                moveComponent.angle += moveComponent.speed * Float(context.deltaTime)
                
                // Calculate position
                let center = moveComponent.center
                let x = cos(moveComponent.angle) * moveComponent.radius + center.x
                let y = sin(moveComponent.angle) * moveComponent.radius + center.y
                entity.position = SIMD3<Float>(x, y, entity.position.z)
                
                entity.components[MoveComponent.self] = moveComponent
            }
        }
    }
}
