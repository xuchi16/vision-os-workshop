//
//  BarsApp.swift
//  Bars
//
//  Created by xuchi on 2023/12/28.
//

import SwiftUI

@main
struct BarsApp: App {
    
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
