//
//  ImmersiveView.swift
//  ImageTrack
//
//  Created by xuchi on 2024/7/16.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    @Environment(AppModel.self) var model
    
    var body: some View {
        RealityView { content in
            content.add(model.setupContent())
        }
        .task {
            await model.runSession()
        }
        .task {
            await model.processImageTrackingUpdate()
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
