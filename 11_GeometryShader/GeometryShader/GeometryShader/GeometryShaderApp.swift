//
//  GeometryShaderApp.swift
//  GeometryShader
//
//  Created by xuchi on 2024/1/26.
//

import SwiftUI

@main
struct GeometryShaderApp: App {
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
