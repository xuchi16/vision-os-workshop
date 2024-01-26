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

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
