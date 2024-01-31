//
//  SandClockApp.swift
//  SandClock
//
//  Created by xuchi on 2024/1/25.
//

import SwiftUI

@main
struct SandClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
