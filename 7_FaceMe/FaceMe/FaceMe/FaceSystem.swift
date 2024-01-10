//
//  FaceSystem.swift
//  FaceMe
//
//  Created by xuchi on 2024/1/10.
//

import RealityKit

public struct FaceSystem: System {
    
    static let faceQuery = EntityQuery(where: .has(FaceComponent.self))
    
    public init(scene: Scene) {
    }
    
    public func update(context: SceneUpdateContext) {
        let entities = context.scene.performQuery(Self.faceQuery)
        
        for entity in entities {
            guard var followEntity = entity.components[FaceComponent.self] else {
                continue
            }
            
            if followEntity.manager == nil {
                return
            }
            let cameraTransform = followEntity.manager!.getOriginFromDeviceTransform()
            
            let cameraPosition = SIMD3<Float>(cameraTransform.columns.3.x, cameraTransform.columns.3.y, cameraTransform.columns.3.z)
            let entityPosition = entity.transform.translation
            
            entity.look(at: cameraPosition, from: entityPosition, relativeTo: nil)
        }
    }
}
