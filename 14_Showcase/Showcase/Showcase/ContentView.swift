//
//  ContentView.swift
//  Showcase
//
//  Created by xuchi on 2024/5/20.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    private static let degreeRange: Double = 10
    
    @State var object = Entity()
    @State private var rotationAngle: Double = -degreeRange
    
    var body: some View {
        RealityView { content in
            // Plate
            var plateMaterial = SimpleMaterial()
            plateMaterial.baseColor = MaterialColorParameter.color(.white.withAlphaComponent(0.8))
            plateMaterial.metallic = 0.3
            plateMaterial.roughness = 0.5
            let plate = ModelEntity(
                mesh: .generateCylinder(height: 0.01, radius: 0.2),
                materials: [plateMaterial]
            )
            plate.position = [0, -0.3, 0]
            content.add(plate)
            
            // Object
            object = try! await Entity(named: "gramophone")
            object.scale = object.scale * 0.4
            object.position = [0, -0.25, 0]
            content.add(object)
        }
        .rotation3DEffect(
            .degrees(rotationAngle),
            axis: (x: 0, y: 1, z: 0)
        )
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                rotationAngle = ContentView.degreeRange
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
