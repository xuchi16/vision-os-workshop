//
//  ContentView.swift
//  CarControl
//
//  Created by xuchi on 2024/1/15.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
        
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(ViewModel.self) var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Text("Let's Race!")
                .font(.title)
            
            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
            
            
            VStack {
                HStack {
                    arrowButton(systemName: "arrow.up.left",  directions: [.up, .left])
                    arrowButton(systemName: "arrow.up",  directions: [.up])
                    arrowButton(systemName: "arrow.up.right",  directions: [.up, .right])
                }
                HStack {
                    arrowButton(systemName: "arrow.down.left",  directions: [.down, .left])
                    arrowButton(systemName: "arrow.down",  directions: [.down])
                    arrowButton(systemName: "arrow.down.right",  directions: [.down, .right])
                }
            }
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
    }
    
    private func arrowButton(systemName: String, directions: [Direction]) -> some View {
        Button(action: {}) {
            Image(systemName: systemName)
        }
        .onLongPressGesture(minimumDuration: .infinity, pressing: { isPressing in
            print("direction: \(directions), pressed: \(isPressing)")
            for direction in directions {
                move(direction: direction, press: isPressing)
            }
        }, perform: {})
    }
    
    func move(direction: Direction, press: Bool) {
        switch direction {
        case .up:
            model.forward = press
        case .down:
            model.backward = press
        case .left:
            model.left = press
        case .right:
            model.right = press
        }
    }
    
    enum Direction {
        case up, down, left, right
    }
    
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
