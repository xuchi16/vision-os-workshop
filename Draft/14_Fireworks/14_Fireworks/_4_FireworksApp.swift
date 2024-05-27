//
//  _4_FireworksApp.swift
//  14_Fireworks
//
//  Created by xuchi on 2024/2/23.
//

import SwiftUI

@main
struct _4_FireworksApp: App {
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
