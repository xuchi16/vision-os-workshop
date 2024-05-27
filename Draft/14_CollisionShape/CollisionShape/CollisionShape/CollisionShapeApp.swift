//
//  CollisionShapeApp.swift
//  CollisionShape
//
//  Created by xuchi on 2024/4/16.
//

import SwiftUI

@main
struct CollisionShapeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
