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
        }
        
        WindowGroup(id: "windowView") {
            WindowView()
        }
        
        WindowGroup(id: "volumeView") {
            VolumeView()
        }.windowStyle(.volumetric)
        
        ImmersiveSpace(id: "immersiveView") {
            ImmersiveView()
        }
    }
}
