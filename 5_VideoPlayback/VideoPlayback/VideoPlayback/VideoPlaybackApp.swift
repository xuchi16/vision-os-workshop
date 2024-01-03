//
//  VideoPlaybackApp.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/2.
//

import SwiftUI

@main
struct VideoPlaybackApp: App {
    
    @State private var playerModel = PlayerModel()
    
    private var match = getMatchData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(match: match)
                .environment(playerModel)
        }
        .defaultSize(CGSize(width: 1510, height: 900))
        
        WindowGroup("goal") {
            GoalView()
        }
        .windowStyle(.volumetric)
    }
    

}
