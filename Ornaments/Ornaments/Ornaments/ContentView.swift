//
//  ContentView.swift
//  Ornaments
//
//  Created by xuchi on 2023/12/31.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        Text("A view with an ornament")
            .ornament(
                visibility: .visible,
                attachmentAnchor: .scene(.leading),
                contentAlignment: .trailing
            ) {
                OrnamentControl()
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
