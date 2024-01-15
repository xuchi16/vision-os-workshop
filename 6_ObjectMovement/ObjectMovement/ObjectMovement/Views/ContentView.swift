//
//  ContentView.swift
//  ObjectMovement
//
//  Created by xuchi on 2024/1/8.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @State private var enableMovement = false
    
    @Environment(ViewModel.self) var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        
        @Bindable var model = model

        VStack {

            Text("Object Movement")
                .font(.title)

            Toggle("Movement Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
            
            HStack {
                Spacer()
                Text("Start orbiting")
                Toggle("Start orbiting", isOn: $enableMovement)
                    .labelsHidden()
                Spacer()
            }
            .padding(.top, 20)

        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "MovementSpace") {
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
        .onChange(of: enableMovement) { _, newValue in
            model.enableMovement = newValue
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
