//
//  StatsView.swift
//  VideoPlayback
//
//  Created by xuchi on 2024/1/3.
//

import SwiftUI

struct StatsView: View {
    
    var match: MatchModel
    
    var body: some View {
        let statsTitle = match.getStatsTitle()
        let home = match.home
        let away = match.away
        
        VStack {
            HStack {
                Text("Stats")
                    .font(.title)
                    .bold()
            }
            .padding()
            Divider()
            
            HStack {
                HStack {
                    Image(home.logoPath)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(home.name).bold()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                
                HStack {
                    Image(away.logoPath)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(away.name).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
            
            ForEach(0..<home.getStats().count, id: \.self) { index in
                HStack {
                    Text(home.getStats()[index])
                    Spacer()
                    Text(statsTitle[index])
                    Spacer()
                    Text(away.getStats()[index])
                }
                .padding()
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    StatsView(match:getMatchData())
}
