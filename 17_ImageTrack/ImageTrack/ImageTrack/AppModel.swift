//
//  AppModel.swift
//  ImageTrack
//
//  Created by xuchi on 2024/7/16.
//

import SwiftUI
import ARKit
import RealityKit
import RealityKitContent

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
    
    private let session = ARKitSession()
    private let imageTracking = ImageTrackingProvider(referenceImages: ReferenceImage.loadReferenceImages(inGroupNamed: "ImageTrackGroup"))
    private var root = Entity()
    private var entity = Entity()
    
    init() {
        Task {
            if let gramophone = try? await Entity(named: "gramophone") {
                gramophone.scale *= 0.1
                entity.addChild(gramophone)
            }
        }
    }
    
    func setupContent() -> Entity {
        return root
    }
    
    func runSession() async {
        do {
            if ImageTrackingProvider.isSupported {
                print("Image tracking provider supported")
                try await session.run([imageTracking])
            }
        } catch {
            print("Run ARKitSession error")
        }
    }
    
    func processImageTrackingUpdate() async {
        for await update in imageTracking.anchorUpdates {
            let imageAnchor = update.anchor
            guard imageAnchor.isTracked else { continue }
                        
            if !root.children.contains(entity) {
                root.addChild(entity)
            }
            
            var entityTransform = imageAnchor.originFromAnchorTransform
            
            // Y asix offset
            entityTransform.columns.3.y += 0.05
            
            entity.transform = Transform(matrix: entityTransform)
        }
        
    }
}
