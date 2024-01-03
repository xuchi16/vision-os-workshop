//
//  ContentView.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(PlayerModel.self) private var playerModel

    @State private var isGoalPanelVisible = Visibility.hidden
    
    var match: MatchModel
    
    var body: some View {
        Spacer()
        Text(match.getTitle())
            .font(.title)
        
        PlayerView()
            .onAppear() {
                playerModel.load(match.video)
            }
            .onChange(of: playerModel.goal) { _, newValue in
                if newValue {
                    isGoalPanelVisible = .visible
                } else {
                    isGoalPanelVisible = .hidden
                }
            }
            .ornament(visibility: isGoalPanelVisible,
                      attachmentAnchor: .scene(.top),
                      contentAlignment: .bottom) {
                GoalView()
            }
                      .ornament(
                        attachmentAnchor: .scene(.trailing),
                        contentAlignment: .leading) {
                            LineupView(match:match)
                                .glassBackgroundEffect(in: .rect(cornerRadius: 50))
                        }
                        .ornament(
                            attachmentAnchor: .scene(.leading),
                            contentAlignment: .trailing) {
                                StatsView(match:match)
                                    .glassBackgroundEffect(in: .rect(cornerRadius: 50))
                            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(match: getMatchData())
}
