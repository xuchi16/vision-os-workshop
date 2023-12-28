//
//  SunApp.swift
//  Sun
//
//  Created by xuchi on 2023/12/26.
//

import SwiftUI

@main
struct SunApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                    minWidth: 360, maxWidth: 480,
                    minHeight: 270, maxHeight: 360
                )
        }
        .defaultSize(CGSize(width: 400, height: 300))
        .windowResizability(.contentSize)
        
        WindowGroup(id: "windowView") {
            WindowView()
        }
        
        WindowGroup(id: "volumeView") {
            VolumeView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width:0.2, height: 0.2, depth: 0.2, in: .meters)
        
        ImmersiveSpace(id: "immersiveView") {
            ImmersiveView()
        }
    }
}
