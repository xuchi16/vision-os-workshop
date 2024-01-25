//
//  PBRApp.swift
//  PBR
//
//  Created by xuchi on 2024/1/25.
//

import SwiftUI

@main
struct PBRApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 500, height: 300))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
