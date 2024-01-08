//
//  WeatherApp.swift
//  Weather
//
//  Created by xuchi on 2023/12/22.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    private var defaultWidth = 300.0
    private var defaultHeight = 400.0
    private var expandRatio = 1.6
    private var shrinkRatio = 0.8
    private var detailCubeLength = 0.6
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                    minWidth: defaultWidth * shrinkRatio, maxWidth: defaultWidth * expandRatio,
                    minHeight: defaultHeight * shrinkRatio, maxHeight: defaultHeight * expandRatio)
        }
        .windowResizability(.contentSize)
        .defaultSize(CGSize(width: defaultWidth, height: defaultHeight))
        
        WindowGroup(id: "detailView") {
            DetailView()
        }
        .windowResizability(.contentSize)
        .defaultSize(width: detailCubeLength, height: detailCubeLength, depth:detailCubeLength, in:.meters)
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
