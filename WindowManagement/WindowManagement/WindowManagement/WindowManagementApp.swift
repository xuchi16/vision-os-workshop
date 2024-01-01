//
//  WindowManagementApp.swift
//  WindowManagement
//
//  Created by xuchi on 2023/12/28.
//

import SwiftUI

@main
struct WindowManagementApp: App {
    
    @State private var immersionStyle: ImmersionStyle = .progressive
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "StatisticView") {
            StatisticView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: $immersionStyle, in: .progressive)
    }
}
