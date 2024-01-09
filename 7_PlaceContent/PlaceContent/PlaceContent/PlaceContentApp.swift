//
//  PlaceContentApp.swift
//  PlaceContent
//
//  Created by xuchi on 2024/1/9.
//

import SwiftUI

@main
struct PlaceContentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
