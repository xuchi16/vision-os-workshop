//
//  VideoMaterialApp.swift
//  VideoMaterial
//
//  Created by xuchi on 2024/1/31.
//

import SwiftUI

@main
struct VideoMaterialApp: App {
    
    private var playModel = PlayModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 300, height: 400))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(playModel: playModel)
        }
    }
}
