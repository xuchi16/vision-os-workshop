//
//  CarControlApp.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import SwiftUI

@main
struct CarControlApp: App {
    
    @State var model = ViewModel()
    @ObservedObject var gameControllerManager = GameControllerManager()

    init() {
        MoveComponent.registerComponent()
        MoveSystem.registerSystem()
        gameControllerManager.register(model: model)
    }
    
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
