//
//  ContentView.swift
//  Weather
//
//  Created by xuchi on 2023/12/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var weatherClient = WeatherClient()
    
    @State private var isVolumeOn = false
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack {
            WeatherCardView()
            Toggle("Detail", isOn: $isVolumeOn)
                .toggleStyle(.button)
                .onChange(of: isVolumeOn) {_, newValue in
                    if newValue {
                        openWindow(id: "detailView")
                    } else {
                        dismissWindow(id: "detailView")
                    }
                }
        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
