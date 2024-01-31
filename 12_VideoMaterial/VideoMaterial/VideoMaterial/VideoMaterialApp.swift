//
//  VideoMaterialApp.swift
//  VideoMaterial
//
//  Created by xuchi on 2024/1/31.
//

import SwiftUI

@main
struct VideoMaterialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
