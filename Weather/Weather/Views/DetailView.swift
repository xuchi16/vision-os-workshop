//
//  DetailView.swift
//  Weather
//
//  Created by xuchi on 2024/1/5.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DetailView: View {
    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                content.add(scene)
                
                guard let sun = scene.findEntity(named: "Sun") else {
                    return
                }
                
                let totalDuration = 6.0
                let orbit = OrbitAnimation(duration: totalDuration,
                                           axis: [0, 0, 1],
                                           startTransform: Transform(scale: [0.5, 0.5, 0.5], translation: [-0.2, 0, 0]),
                                           bindTarget: .transform)
                let trimmed = orbit.trimmed(start: 0, end: totalDuration / 2)
                
                let animationResource = try! AnimationResource.generate(with: trimmed)
                sun.playAnimation(animationResource)
            }
        }

    }
}

#Preview {
    DetailView()
}
