//
//  SkyboxApp.swift
//  Skybox
//
//  Created by xuchi on 2024/2/7.
//

import SwiftUI

@main
struct SkyboxApp: App {
    @State private var style: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 300, height: 400))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
