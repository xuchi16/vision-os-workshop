//
//  MoveComponent.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import RealityKit

public struct MoveComponent: Component {

    let model: ViewModel
    let speed: Float = 0.3
    let turnSpeed: Float = 1.0
    
    private let left = SIMD3<Float>(0, 1, 0)
    private let right = SIMD3<Float>(0, -1, 0)
    
    func getDirection() -> SIMD3<Float> {
        if model.left {
            return left
        }
        if model.right {
            return right
        }
        return SIMD3<Float>(0, 0, 0)
    }
}
