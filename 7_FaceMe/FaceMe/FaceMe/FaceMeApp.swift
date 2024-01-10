//
//  FaceMeApp.swift
//  FaceMe
//
//  Created by xuchi on 2024/1/10.
//

import SwiftUI

@main
struct FaceMeApp: App {
    
    init() {
        FaceComponent.registerComponent()
        FaceSystem.registerSystem()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 300, height: 400))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
