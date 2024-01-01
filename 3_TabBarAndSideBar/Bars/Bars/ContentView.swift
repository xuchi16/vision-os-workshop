//
//  ContentView.swift
//  Bars
//
//  Created by xuchi on 2023/12/28.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var barIdx = 1
    @Environment(ViewModel.self) var viewModel;
    
    var body: some View {
        
        @Bindable var viewModel = viewModel
        
        TabView(selection: $barIdx, content: {
            ForEach(viewModel.models) { model in
                PageView(dataModel : model)
                    .tabItem { Label(model.labelName, systemImage: model.labelImage) }
                    .tag(model.id)
            }
        })
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
