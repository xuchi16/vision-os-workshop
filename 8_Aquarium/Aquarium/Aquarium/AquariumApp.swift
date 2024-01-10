//
//  AquariumApp.swift
//  Aquarium
//
//  Created by xuchi on 2024/1/11.
//

import SwiftUI

@main
struct AquariumApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
