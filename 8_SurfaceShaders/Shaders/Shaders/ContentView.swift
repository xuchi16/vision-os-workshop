//
//  ContentView.swift
//  Shaders
//
//  Created by xuchi on 2024/1/11.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var sliderValue = 0.0
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(ViewModel.self) var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Text("Shaders")
                .font(.title)

            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)

            HStack {
                Spacer()
                Text("Slider: ")
                Slider(value: $sliderValue, in: 0...100)
                Spacer()
            }
            .padding(.top, 20)
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
        .onChange(of: sliderValue) { _, newValue in
            model.percentage = newValue
            update()
        }
        .onAppear() {
            update()
        }
    }
    
    private func update() {
        model.update()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
