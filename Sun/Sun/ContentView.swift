//
//  ContentView.swift
//  Sun
//
//  Created by xuchi on 2023/12/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var isWindowShown = false
    
    @State private var isVolumeWindowShown = false
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @State private var isImmersiveSpaceShown = false
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        Text("Window, Volume and Space")
            .font(.title)
        
        Toggle("Window", isOn: $isWindowShown)
            .toggleStyle(.button)
            .onChange(of: isWindowShown) { _, show in
                if show {
                    openWindow(id: "windowView")
                } else {
                    dismissWindow(id: "windowView")
                }
            }
        
        Toggle("Volume", isOn: $isVolumeWindowShown)
            .toggleStyle(.button)
            .onChange(of: isVolumeWindowShown) { _, show in
                if show {
                    openWindow(id: "volumeView")
                } else {
                    dismissWindow(id: "volumeView")
                }
            }
        
        Toggle("Space", isOn: $isImmersiveSpaceShown)
            .toggleStyle(.button)
            .onChange(of: isImmersiveSpaceShown) { _, show in
                Task {
                    if show {
                        await openImmersiveSpace(id: "immersiveView")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
