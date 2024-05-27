//
//  ContentView.swift
//  Restitution
//
//  Created by xuchi on 2024/5/27.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var realityContent: RealityViewContent?
    @State private var balls: [Entity] = []
    private let interval: Float = 0.03
    private let count = 10
    
    var body: some View {
        RealityView { content in
            content.add(getFloor())
            
            initBalls()
            for ball in balls {
                content.add(ball)
            }
            realityContent = content
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
                let intensity = Double(i) * 0.1
                let ball = ModelEntity(
                    mesh: .generateSphere(radius: 0.01),
                    materials: [SimpleMaterial(color: UIColor(red: 0, green: intensity, blue: 0, alpha: 1), isMetallic: false)],
                    collisionShape: .generateSphere(radius: 0.01),
                    mass: 0
                )
                ball.physicsBody?.material = PhysicsMaterialResource.generate(friction: 0.005, restitution: 0.1 * Float(i))
                balls.append(ball)
            }
        }
        resetBalls()
    }
    
    func resetBalls() {
        var idx = 0
        for ball in balls {
            ball.position = [-Float(count) / 2 * interval + interval * Float(idx), -0.1, 0]
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
    
    func getFloor() -> Entity {
        let floor = ModelEntity(
            mesh: .generateBox(width: 0.5, height: 0.01, depth: interval),
            materials: [SimpleMaterial(color: .brown, isMetallic: false)],
            collisionShape: .generateBox(width: 0.5, height: 0.01, depth: interval),
            mass: 0
        )
        if let _ = floor.physicsBody {
            print("Floor body")
            floor.physicsBody?.material = PhysicsMaterialResource.generate(friction: 0.005, restitution: 0.2)
        }
        floor.position = [0, -0.4, 0]
        return floor
    }
    

}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
