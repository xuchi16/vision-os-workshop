//
//  ContentView.swift
//  PositionAndSize
//
//  Created by xuchi on 2023/12/28.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showWindow = false

    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Toggle("Show volume window", isOn: $showWindow)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
        .padding()
        .onChange(of: showWindow) { _, show in
            if show {
                openWindow(id: "volumeView")
            } else {
                dismissWindow(id: "volumeView")
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
