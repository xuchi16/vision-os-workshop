//
//  ShadersApp.swift
//  Shaders
//
//  Created by xuchi on 2024/1/11.
//

import SwiftUI

@main
struct ShadersApp: App {
    @State var model = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
        .defaultSize(CGSize(width: 300, height: 400))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(model)
        }
    }
}
