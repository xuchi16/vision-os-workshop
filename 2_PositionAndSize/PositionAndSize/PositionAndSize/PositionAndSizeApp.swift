//
//  PositionAndSizeApp.swift
//  PositionAndSize
//
//  Created by xuchi on 2023/12/28.
//

import SwiftUI

@main
struct PositionAndSizeApp: App {
    private var defaultWidth = 800.0
    private var defaultHeight = 600.0
    private var expandRatio = 1.6
    private var shrinkRatio = 0.8
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .frame(
                minWidth: defaultWidth * shrinkRatio, maxWidth: defaultWidth * expandRatio,
                minHeight: defaultHeight * shrinkRatio, maxHeight: defaultHeight * expandRatio)
        }
        .windowResizability(.contentSize)
        .defaultSize(CGSize(width: defaultWidth, height: 600))
        // .defaultPosition(.bottomTrailing)  // 'defaultPosition' is unavailable in visionOS
        
        WindowGroup(id: "volumeView") {
            VolumeView()
        }
        .defaultSize(width: 0.4, height: 0.4, depth: 0.4, in: .meters)
        .windowStyle(.volumetric)

    }
}
