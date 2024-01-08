//
//  ObjectMovementApp.swift
//  ObjectMovement
//
//  Created by xuchi on 2024/1/8.
//

import SwiftUI

@main
struct ObjectMovementApp: App {
    
    @State var model = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
        .defaultSize(CGSize(width: 300, height: 400))

        ImmersiveSpace(id: "MovementSpace") {
            MovementView()
                .environment(model)
        }
    }
}
