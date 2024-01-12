//
//  ViewModel.swift
//  Shaders
//
//  Created by xuchi on 2024/1/13.
//

import Foundation
import RealityKit
import RealityKitContent
import Observation

@Observable
class ViewModel {
    var percentage: Double = 0
    var boxes: [ModelEntity] = []
    
    func update() {
        for box in boxes {
            print(box.name)
            if var boxMaterial = box.model?.materials.first as? ShaderGraphMaterial {
                try? boxMaterial.setParameter(name: "ScrollPercentage", value: .float(Float(percentage)))
                box.model?.materials = [boxMaterial]
            }
        }
        
    }
}
