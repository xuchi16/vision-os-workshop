//
//  ContentView.swift
//  Friction
//
//  Created by xuchi on 2024/5/27.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var entity = Entity()
    @State private var balls: [Entity] = []
    private let interval: Float = 0.03
    private let frictionOptions: [Float] = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    private let count = 10
    
    var body: some View {
        RealityView { content in
            for floor in getFloors() {
                entity.addChild(floor)
            }
            
            initBalls()
            for ball in balls {
                entity.addChild(ball)
            }
            
            entity.position = [0, 0, 0.3]
            content.add(entity)
        }
        .toolbar {
            ToolbarItem(placement: .bottomOrnament) {
                Button("Gravity", systemImage: "arrow.down") {
                    addGravity(mass: 1)
                }
            }
            
            ToolbarItem(placement: .bottomOrnament) {
                Button("Reset", systemImage: "arrow.counterclockwise") {
                    resetBalls()
                }
            }
        }
    }
    
    func initBalls() {
        if balls.isEmpty {
            for i in 0...count {
                let intensity = getIntensity(i)
                let ball = ModelEntity(
                    mesh: .generateSphere(radius: 0.01),
                    materials: [SimpleMaterial(color: UIColor(red: 0, green: intensity, blue: 0, alpha: 1), isMetallic: false)],
                    collisionShape: .generateSphere(radius: 0.01),
                    mass: 0
                )
                ball.physicsBody?.material = PhysicsMaterialResource.generate(staticFriction: getFriction(idx: i, type: "Ball"), dynamicFriction: getFriction(idx: i, type: "Ball"), restitution: 0.1)
                balls.append(ball)
                
            }
        }
        resetBalls()
    }
    
    func resetBalls() {
        var idx = 0
        for ball in balls {
            ball.position = [-0.45, -0.05, -Float(count) / 2 * interval + interval * Float(idx)]
            addGravity(mass: 0)
            idx += 1
        }
    }
    
    private func addGravity(mass: Float) {
        var idx = 0
        for ball in balls {
            if let ball = ball as? ModelEntity, let _ = ball.physicsBody {
                ball.physicsBody?.massProperties = PhysicsMassProperties(shape: .generateSphere(radius: 0.01), mass: mass)
            }
            idx += 1
        }
    }
    
    func getFloors() -> [Entity] {
        var floors: [Entity] = []
        for i in 0...count {
            let intensity = getIntensity(i)
            let floor = ModelEntity(
                mesh: .generateBox(width: 1.0, height: 0.01, depth: interval),
                materials: [SimpleMaterial(color: UIColor(red: intensity, green: intensity, blue: intensity, alpha: 1), isMetallic: false)],
                collisionShape: .generateBox(width: 1.0, height: 0.01, depth: interval),
                mass: 0
            )
            if let _ = floor.physicsBody {
                floor.physicsBody?.material = PhysicsMaterialResource.generate(staticFriction: getFriction(idx: i, type: "Floor"), dynamicFriction: getFriction(idx: i, type: "Floor"), restitution: 0.1)
            }
            floor.position = [0, -0.2, -Float(count) / 2 * interval + interval * Float(i)]
            floor.transform.rotation = simd_quatf(angle: -15 * .pi / 180, axis: simd_float3(x: 0, y: 0, z: 1))
            floors.append(floor)
        }
        return floors
    }
    
    
    func getIntensity(_ idx: Int) -> Double {
        1 - ((Double(idx) / Double(count)) * 0.6)
    }
    
    func getFriction(idx: Int, type: String) -> Float {
        let result = frictionOptions[idx % frictionOptions.count]
        print("Friction of \(type): \(result)")
        return result
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
