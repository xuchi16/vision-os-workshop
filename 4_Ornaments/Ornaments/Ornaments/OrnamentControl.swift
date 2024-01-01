//
//  OrnamentControl.swift
//  Ornaments
//
//  Created by xuchi on 2023/12/31.
//

import SwiftUI

struct OrnamentControl: View {
    
    @State var isPencilOn = true
    @State var isEraserOn = false

    var body: some View {
        VStack() {
            VStack {
                Toggle(isOn: $isPencilOn) {
                    Label("Pencil", systemImage: "pencil")
                }
                .help("Pencil")
                .padding(12)
                
                Toggle(isOn: $isEraserOn) {
                    Label("Eraser", systemImage: "eraser")
                }
                .help("Eraser")
                .padding(12)
            }
            .glassBackgroundEffect(in: .rect(cornerRadius: 50))
            .toggleStyle(.button)
            .buttonStyle(.borderless)
            .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    OrnamentControl()
}
