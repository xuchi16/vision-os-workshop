//
//  MoveComponent.swift
//  ObjectMovement
//
//  Created by xuchi on 2024/1/8.
//

import RealityKit

public struct MoveComponent: Component {
    public var movementEnabled: () -> Bool
    public var speed: Float = 2.0 // Movement peed
    public var radius: Float = 0.2 // Radius of the routine
    public var angle: Float = 0.0 // Current angle
    
    public var center: SIMD3<Float>
    
    public init(position: SIMD3<Float>) {
        movementEnabled = {false}
        center = [position.x - radius, position.y, position.z]
    }
    
}
