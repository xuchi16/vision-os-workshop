//
//  ShowcaseApp.swift
//  Showcase
//
//  Created by xuchi on 2024/5/20.
//

import SwiftUI

@main
struct ShowcaseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
